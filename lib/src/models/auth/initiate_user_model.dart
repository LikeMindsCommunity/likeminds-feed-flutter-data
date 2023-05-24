import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'initiate_user_model.g.dart';

class InitiateUser {
  final User user;
  final Community community;

  InitiateUser({
    required this.user,
    required this.community,
  });

  factory InitiateUser.fromEntity(InitiateUserEntity entity) {
    return InitiateUser(
      user: User.fromEntity(entity.user),
      community: Community.fromEntity(entity.community),
    );
  }

  InitiateUserEntity toEntity() {
    return InitiateUserEntity(
      user: user.toEntity(),
      community: community.toEntity(),
    );
  }
}

@JsonSerializable()
class InitiateUserEntity {
  final UserEntity user;
  final CommunityEntity community;

  InitiateUserEntity({
    required this.user,
    required this.community,
  });

  factory InitiateUserEntity.fromJson(Map<String, dynamic> json) =>
      _$InitiateUserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$InitiateUserEntityToJson(this);
}
