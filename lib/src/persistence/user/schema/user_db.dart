import 'package:realm/realm.dart';

part 'user_db.g.dart';

@RealmModel(ObjectType.embeddedObject)
class _LMSDKClientInfoRO {
  @MapTo('community')
  late final int community;
  @MapTo('user')
  late final int user;
  late final String uuid;
}

@RealmModel()
class _LMUserRO {
  @MapTo("_id")
  late final int id;
  late final String name;
  @MapTo('image_url')
  late final String? imageUrl;
  @MapTo('is_guest')
  late final bool? isGuest;
  @MapTo('is_deleted')
  late final bool? isDeleted;
  @PrimaryKey()
  late final String uuid;
  @MapTo('organisation_name')
  late final String? organisationName;
  @MapTo('sdk_client_info')
  late final _LMSDKClientInfoRO? sdkClientInfo;
  @MapTo('updated_at')
  late final int? updatedAt;
  @MapTo('is_owner')
  late final bool? isOwner;
  @MapTo('custom_title')
  late final String? customTitle;
  @MapTo('member_since')
  late final String? memberSince;
  late final String? route;
  late final int? state;
  @MapTo('community_id')
  late final int? communityId;
  @MapTo('created_at')
  late final int? createdAt;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "imageUrl": imageUrl,
      "isGuest": isGuest,
      "isDeleted": isDeleted,
      "uuid": uuid,
      "organisationName": organisationName,
      "sdkClientInfo": sdkClientInfo,
      "updatedAt": updatedAt,
      "isOwner": isOwner,
      "customTitle": customTitle,
      "memberSince": memberSince,
      "route": route,
      "state": state,
      "communityId": communityId,
    };
  }
}

@RealmModel(ObjectType.embeddedObject)
class _LMMemberRightRO {
  @MapTo('_id')
  late final int id;
  @MapTo('is_selected')
  late final bool isSelected;
  @MapTo("state")
  late final int state;
  @MapTo('title')
  late final String title;
}

@RealmModel()
class _LMMemberStateRO {
  @MapTo('edit_required')
  late final bool editRequired;
  @MapTo('uuid')
  @PrimaryKey()
  late final String uuid;
  @MapTo('member')
  late final _LMUserRO? member;
  @MapTo('member_rights')
  late final List<_LMMemberRightRO> memberRights;
  @MapTo('state')
  late final int state;
}
