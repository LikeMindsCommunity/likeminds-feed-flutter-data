import 'package:likeminds_feed/src/models/models.dart';

class GetLogResponse {
  List<LMLogBuilder> lmLogsBuilder;

  GetLogResponse._({required this.lmLogsBuilder});
}

class GetLogResponseBuilder {
  List<LMLogBuilder>? _lmLogsBuilder;

  void lmLogsBuilder(List<LMLogBuilder> lmLogsBuilder) {
    _lmLogsBuilder = lmLogsBuilder;
  }

  GetLogResponse build() {
    return GetLogResponse._(lmLogsBuilder: _lmLogsBuilder!);
  }
}
