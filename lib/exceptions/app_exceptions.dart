class AppException implements Exception {
  AppException({
    this.title,
    this.detail,
  });

  factory AppException.error(dynamic error) =>
      AppException(title: error.toString());
  factory AppException.unknown() => AppException(title: '不明なエラーです');

  final String? title;
  final String? detail;

  @override
  String toString() => '${title ?? ''}${detail != null ? ', $detail' : ''}';
}
