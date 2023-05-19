import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/auth/member_right_model.dart';
import 'package:likeminds_feed/src/models/auth/user_model.dart';

part 'member_state_response_model.g.dart';

class MemberStateResponse {
  final bool success;
  final String? errorMessage;
  final String? createdAt;
  final bool? editRequired;
  final User? member;
  final List<MemberRight>? memberRights;
  final int? state;

  MemberStateResponse({
    required this.success,
    this.errorMessage,
    this.createdAt,
    this.editRequired,
    this.member,
    this.memberRights,
    this.state,
  });

  factory MemberStateResponse.fromEntity(MemberStateResponseEntity entity) {
    return MemberStateResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      createdAt: entity.createdAt,
      editRequired: entity.editRequired,
      member: entity.member != null ? User.fromEntity(entity.member!) : null,
      memberRights: entity.memberRights,
      state: entity.state,
    );
  }

  toEntity() {
    return MemberStateResponseEntity(
      success: success,
      errorMessage: errorMessage,
      createdAt: createdAt,
      editRequired: editRequired,
      member: member != null ? member!.toEntity() : null,
      memberRights: memberRights,
      state: state,
    );
  }

  factory MemberStateResponse.fromJson(Map<String, dynamic> json) {
    return MemberStateResponse(
      success: json['success'],
      errorMessage: json['error_message'],
      createdAt: json['created_at'],
      editRequired: json['edit_required'],
      member: json['member'] != null ? null : null,
      memberRights: json['member_rights'] != null
          ? (json['member_rights'] as List)
              .map((e) => MemberRight.fromJson(e))
              .toList()
          : null,
      state: json['state'],
    );
  }
}

@JsonSerializable()
class MemberStateResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'edit_required')
  final bool? editRequired;
  final UserEntity? member;
  @JsonKey(name: 'member_rights')
  final List<MemberRight>? memberRights;
  final int? state;

  MemberStateResponseEntity({
    required this.success,
    this.errorMessage,
    this.createdAt,
    this.editRequired,
    this.member,
    this.memberRights,
    this.state,
  });

  factory MemberStateResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$MemberStateResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MemberStateResponseEntityToJson(this);
}
