class DecodeUrlRequest {
  String url;

  DecodeUrlRequest._({
    required this.url,
  });

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}

class DecodeUrlRequestBuilder {
  String? _url;

  void url(String url) {
    _url = url;
  }

  DecodeUrlRequest build() {
    return DecodeUrlRequest._(
      url: _url!,
    );
  }
}
