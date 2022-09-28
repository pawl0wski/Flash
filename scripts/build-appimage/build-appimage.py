import logging
import os.path
import shutil
import sys
import tempfile
import urllib.request
from typing import Optional


def create_temp_directory() -> str:
    return tempfile.mkdtemp()


def user_is_in_correct_directory() -> bool:
    # Check if dart's pubspec file exist in current working directory
    return os.path.exists("pubspec.yaml")


def copy_template_to_directory(dist_dir: str):
    template_dir = "scripts/build-appimage/template/"
    files = os.listdir(template_dir)
    for file in files:
        shutil.copy2(os.path.join(template_dir, file), dist_dir)


def build_project() -> int:
    return os.system("flutter build linux --release")


def create_project_tree(project_path: str):
    os.mkdir(os.path.join(project_path, "usr"))
    os.mkdir(os.path.join(project_path, "usr/bin"))
    os.mkdir(os.path.join(project_path, "usr/lib"))


def copy_built_project(project_path: str):
    built_dir = "build/linux/x64/release/bundle"
    shutil.copytree(os.path.join(built_dir), os.path.join(project_path, "usr/lib/flash"))


def create_executable_symbolic_link(project_path: str):
    os.symlink("../lib/flash/flash", os.path.join(project_path, "usr/bin/flash"))


def check_if_user_have_appimagetool() -> Optional[str]:
    return shutil.which("appimagetool")


def download_appimagetool_to_tmp():
    temp_file = tempfile.mktemp()
    urllib.request.urlretrieve(
        "https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage", temp_file)
    os.chmod(temp_file, 0o774)
    return temp_file


def build_appimage(appimagetool_path: str, appimage_dir: str) -> int:
    return os.system(f"env ARCH=x86_64 {appimagetool_path} {appimage_dir}")


def delete_appimage_dir(appimage_dir: str):
    shutil.rmtree(appimage_dir)


def delete_appimage_tool_if_is_in_tmp(appimagetool_path: str) -> bool:
    in_tmp = appimagetool_path.startswith("/tmp")
    if in_tmp:
        os.remove(appimagetool_path)
    return in_tmp


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    if not user_is_in_correct_directory():
        logging.error("Run the application in the directory where the project is located")
        sys.exit(1)
    temp_dir = create_temp_directory()
    logging.info(f"Temp directory created \"{temp_dir}\"")
    copy_template_to_directory(temp_dir)
    logging.info("Template copied to temp directory")
    logging.info("Application building started ...")
    return_code = build_project()
    if return_code != 0:
        logging.error("An error occurred while building the application")
        sys.exit(1)
    logging.info("Application have been built successfully")
    create_project_tree(temp_dir)
    logging.info("Created project tree in temp directory")
    copy_built_project(temp_dir)
    create_executable_symbolic_link(temp_dir)
    logging.info("Built project copied to temp directory")
    tool_path = check_if_user_have_appimagetool()
    if tool_path is None:
        logging.warning("User don't have installed AppImageTool. Downlading...")
        tool_path = download_appimagetool_to_tmp()
        logging.info("AppImageTool successfuly downloaded")
    logging.info(f"AppImageTool path: {tool_path}")
    logging.info("Creating AppImage")
    return_code = build_appimage(tool_path, temp_dir)
    if return_code != 0:
        logging.error("An error occurred while creating the appimage")
        sys.exit(1)
    logging.info("Successfully created AppImage")
    delete_appimage_dir(temp_dir)
    logging.info("Temp directory deleted")
    appimagetool_deleted = delete_appimage_tool_if_is_in_tmp(tool_path)
    if appimagetool_deleted:
        logging.info("Deleted temporary AppImageTool")
