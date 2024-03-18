import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/models/auth/member_right_model.dart';
import 'package:likeminds_feed/src/persistence/user/schema/user_db.dart';

class LMUserInterface {
  static User toUser(LMUserRO userDBModel) {
    return User(
      id: userDBModel.id,
      name: userDBModel.name,
      imageUrl: userDBModel.imageUrl,
      isGuest: userDBModel.isGuest,
      uuid: userDBModel.uuid,
      sdkClientInfo: toSDKClientInfo(userDBModel.sdkClientInfo!),
      communityId: userDBModel.communityId,
      createdAt: userDBModel.createdAt,
      isDeleted: userDBModel.isDeleted,
      isOwner: userDBModel.isOwner,
      customTitle: userDBModel.customTitle,
      memberSince: userDBModel.memberSince,
      route: userDBModel.route,
      state: userDBModel.state,
      updatedAt: userDBModel.updatedAt,
      organisationName: userDBModel.organisationName,
    );
  }

  static LMUserRO fromUser(User user) {
    return LMUserRO(
      user.id,
      user.name,
      user.uuid,
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

  static SDKClientInfo toSDKClientInfo(LMSDKClientInfoRO sdkClientInfoDBModel) {
    return SDKClientInfo(
      community: sdkClientInfoDBModel.community,
      user: sdkClientInfoDBModel.user,
      uuid: sdkClientInfoDBModel.uuid,
    );
  }

  static LMSDKClientInfoRO fromSDKClientInfo(SDKClientInfo sdkClientInfo) {
    return LMSDKClientInfoRO(
        sdkClientInfo.community, sdkClientInfo.user, sdkClientInfo.uuid);
  }

  static LMMemberStateRO fromMemberState(MemberStateResponse memberState) {
    if (!memberState.success) {
      throw Exception("MemberStateResponse is not successful");
    }
    return LMMemberStateRO(
      memberState.editRequired!,
      memberState.member!.uuid,
      memberState.state!,
      member: fromUser(memberState.member!),
      memberRights:
          memberState.memberRights!.map((e) => fromMemberRight(e)).toList(),
    );
  }

  static LMMemberRightRO fromMemberRight(MemberRight memberRight) {
    return LMMemberRightRO(
      memberRight.id,
      memberRight.isSelected,
      memberRight.state,
      memberRight.title,
    );
  }

  static MemberStateResponse toMemberState(LMMemberStateRO memberStateDBModel) {
    return MemberStateResponse(
      success: true,
      editRequired: false,
      member: LMUserInterface.toUser(memberStateDBModel.member!),
      memberRights: memberStateDBModel.memberRights
          .map((e) => LMUserInterface.toMemberRight(e))
          .toList(),
      state: memberStateDBModel.state,
    );
  }

  static MemberRight toMemberRight(LMMemberRightRO memberRightDBModel) {
    return MemberRight(
      id: memberRightDBModel.id,
      isSelected: memberRightDBModel.isSelected,
      state: memberRightDBModel.state,
      title: memberRightDBModel.title,
    );
  }
}
