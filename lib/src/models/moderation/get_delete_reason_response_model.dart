import 'package:likeminds_feed/src/models/moderation/delete_reason_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_delete_reason_response_model.g.dart';

class GetDeleteReasonResponse {
  final bool success;
  final String? errorMessage;
  final List<DeleteReason>? reportTags;

  GetDeleteReasonResponse({
    this.reportTags,
    required this.success,
    this.errorMessage,
  });

  factory GetDeleteReasonResponse.fromEntity(
      GetDeleteReasonResponseEntity entity) {
    return GetDeleteReasonResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      reportTags: entity.reportTags
          ?.map<DeleteReason>((e) => DeleteReason.fromEntity(e))
          .toList(),
    );
  }

  GetDeleteReasonResponseEntity toEntity() {
    return GetDeleteReasonResponseEntity(
      success: success,
      errorMessage: errorMessage,
      reportTags:
          reportTags?.map<DeleteReasonEntity>((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetDeleteReasonResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'report_tags')
  final List<DeleteReasonEntity>? reportTags;

  GetDeleteReasonResponseEntity({
    this.reportTags,
    required this.success,
    this.errorMessage,
  });

  factory GetDeleteReasonResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetDeleteReasonResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetDeleteReasonResponseEntityToJson(this);
}
