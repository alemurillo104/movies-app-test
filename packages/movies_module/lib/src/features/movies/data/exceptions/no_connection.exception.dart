class NoConnectionAndNoCacheException implements Exception {
  final String message =
      'No hay conexión a internet y no se encontraron datos de caché.';
  @override
  String toString() => 'NoConnectionAndNoCacheException: $message';
}
