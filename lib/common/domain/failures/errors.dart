class NoBaseUrlError extends Error {
  @override
  String toString() {
    return 'No Base URL found in storage';
  }
}