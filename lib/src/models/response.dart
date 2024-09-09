class LMResponse<T> {
  bool success;
  String? errorMessage;
  T? data;

  LMResponse({
    required this.success,
    this.errorMessage,
    this.data,
  });

  factory LMResponse.success({required T? data}) {
    return LMResponse(
      success: true,
      data: data,
    );
  }
  factory LMResponse.error({required String errorMessage}) {
    return LMResponse(
      success: false,
      errorMessage: errorMessage,
    );
  }
  factory LMResponse.fromData({required LMResponse response, T? data}) {
    if (response.success) {
      return LMResponse.success(data: data);
    } else {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
  }
}
