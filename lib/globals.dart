class Globals {
  static bool _scannerEnabled = true;

  static setScannerEnabled(bool newValue) {
    Globals._scannerEnabled = newValue;
  }

  static get scannerEnabled => Globals._scannerEnabled;
}
