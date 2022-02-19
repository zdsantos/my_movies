class ApiResult<T> {
  final bool success;
  final T? data;
  final String? error;

  ApiResult({this.success = false, this.data, this.error});
}
