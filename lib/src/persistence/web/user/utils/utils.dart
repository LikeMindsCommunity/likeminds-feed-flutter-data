import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/models/auth/member_right_model.dart';
import 'package:likeminds_feed/src/persistence/web/user/schema/user_hive.dart';

class LMUserInterfaceWeb {
  static User toUser(LMUserHive userHiveModel) {
    return User(
      id: userHiveModel.id,
      name: userHiveModel.name,
      imageUrl: userHiveModel.imageUrl,
      isGuest: userHiveModel.isGuest,
      uuid: userHiveModel.uuid,
      sdkClientInfo: toSDKClientInfo(userHiveModel.sdkClientInfo!),
      communityId: userHiveModel.communityId,
      createdAt: userHiveModel.createdAt,
      isDeleted: userHiveModel.isDeleted,
      isOwner: userHiveModel.isOwner,
      customTitle: userHiveModel.customTitle,
      memberSince: userHiveModel.memberSince,
      route: userHiveModel.route,
      state: userHiveModel.state,
      updatedAt: userHiveModel.updatedAt,
      organisationName: userHiveModel.organisationName,
    );
  }

  static LMUserHive fromUser(User user) {
    return LMUserHive(
      id: user.id,
      name: user.name,
      uuid: user.uuid,
      communityId: user.communityId,
      createdAt: user.createdAt,
      imageUrl: user.imageUrl,
      isDeleted: user.isDeleted,
      isGuest: user.isGuest,
      isOwner: user.isOwner,
      memberSince: user.memberSince,
      organisationName: user.organisationName,
      route: user.route,
      sdkClientInfo: fromSDKClientInfo(user.sdkClientInfo),
      state: user.state,
      updatedAt: user.updatedAt,
      customTitle: user.customTitle,
    );
  }

  static SDKClientInfo toSDKClientInfo(
      LMSDKClientInfoHive sdkClientInfoHiveModel) {
    return SDKClientInfo(
      community: sdkClientInfoHiveModel.community,
      user: sdkClientInfoHiveModel.user,
      uuid: sdkClientInfoHiveModel.uuid,
    );
  }

  static LMSDKClientInfoHive fromSDKClientInfo(SDKClientInfo sdkClientInfo) {
    return LMSDKClientInfoHive(
      community: sdkClientInfo.community,
      user: sdkClientInfo.user,
      uuid: sdkClientInfo.uuid,
    );
  }

  static LMMemberStateHive fromMemberState(MemberStateResponse memberState) {
    if (!memberState.success) {
      throw Exception("MemberStateResponse is not successful");
    }
    return LMMemberStateHive(
      editRequired: memberState.editRequired!,
      uuid: memberState.member!.uuid,
      state: memberState.state!,
      member: memberState.member != null ? fromUser(memberState.member!) : null,
      memberRights:
          memberState.memberRights?.map((e) => fromMemberRight(e)).toList() ??
              [],
    );
  }

  static LMMemberRightHive fromMemberRight(MemberRight memberRight) {
    return LMMemberRightHive(
      id: memberRight.id,
      isSelected: memberRight.isSelected,
      state: memberRight.state,
      title: memberRight.title,
    );
  }

  static MemberStateResponse toMemberState(LMMemberStateHive memberStateHive) {
    return MemberStateResponse(
      editRequired: memberStateHive.editRequired,
      member: memberStateHive.member != null
          ? toUser(memberStateHive.member!)
          : null,
      memberRights:
          memberStateHive.memberRights.map((e) => toMemberRight(e)).toList(),
      state: memberStateHive.state,
      success: true,
    );
  }

  static MemberRight toMemberRight(LMMemberRightHive memberRightHive) {
    return MemberRight(
      id: memberRightHive.id,
      isSelected: memberRightHive.isSelected,
      state: memberRightHive.state,
      title: memberRightHive.title,
    );
  }
}
