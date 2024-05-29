class LMResponse<T> {
  bool success;
  String? errorMessage;
  T? data;

  LMResponse({required this.success, this.errorMessage, this.data});

  factory LMResponse.fromJson(Map<String, dynamic> json, [T? data]) =>
      LMResponse(
          success: json['success'],
          errorMessage: json['error_message'],
          data: data);
}
