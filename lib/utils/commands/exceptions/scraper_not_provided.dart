class ScraperNotProvided implements Exception {
  final String executorName;
  ScraperNotProvided({required this.executorName});

  @override
  String toString() {
    return "ScraperNotProvided: $executorName don't have scraper";
  }
}
