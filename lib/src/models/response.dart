class LMResponse<T> {
  bool success;
  String? errorMessage;
  T? data;

  LMResponse({required this.success, this.errorMessage, this.data});
}
