class PackageExistExeption implements Exception {
  final String message;

  PackageExistExeption(this.message);

  @override
  String toString() {
    return message;
  }
}