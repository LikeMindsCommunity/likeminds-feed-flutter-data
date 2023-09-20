import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/community/community_configurations_model.dart';

part 'get_community_configurations_response_model.g.dart';

class GetCommunityConfigurationsResponse {
  final bool success;
  final String? errorMessage;
  final List<CommunityConfigurations>? communityConfigurations;

  GetCommunityConfigurationsResponse({
    required this.success,
    this.errorMessage,
    this.communityConfigurations,
  });

  factory GetCommunityConfigurationsResponse.fromEntity(
      GetCommunityConfigurationsResponseEntity entity) {
    return GetCommunityConfigurationsResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      communityConfigurations: entity.communityConfigurations
          ?.map((e) => CommunityConfigurations.fromEntity(e))
          .toList(),
    );
  }

  GetCommunityConfigurationsResponseEntity toEntity() {
    return GetCommunityConfigurationsResponseEntity(
        communityConfigurations:
            communityConfigurations?.map((e) => e.toEntity()).toList(),
        errorMessage: errorMessage,
        success: success);
  }
}

@JsonSerializable()
class GetCommunityConfigurationsResponseEntity {
  final bool success;

  @JsonKey(name: "error_message")
  final String? errorMessage;

  @JsonKey(name: "community_configurations")
  final List<CommunityConfigurationsEntity>? communityConfigurations;

  GetCommunityConfigurationsResponseEntity({
    required this.success,
    this.errorMessage,
    this.communityConfigurations,
  });

  factory GetCommunityConfigurationsResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetCommunityConfigurationsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetCommunityConfigurationsResponseEntityToJson(this);
}
