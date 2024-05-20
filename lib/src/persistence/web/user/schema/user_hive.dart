import 'package:hive/hive.dart';

part 'user_hive.g.dart'; // This line is required for Hive code generation

@HiveType(typeId: 1)
class LMSDKClientInfoHive extends HiveObject {
  @HiveField(0)
  int community;

  @HiveField(1)
  int user;

  @HiveField(2)
  String uuid;

  LMSDKClientInfoHive({
    required this.community,
    required this.user,
    required this.uuid,
  });
}

@HiveType(typeId: 2)
class LMUserHive extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? imageUrl;

  @HiveField(3)
  bool? isGuest;

  @HiveField(4)
  bool? isDeleted;

  @HiveField(5)
  String uuid;

  @HiveField(6)
  String? organisationName;

  @HiveField(7)
  LMSDKClientInfoHive? sdkClientInfo;

  @HiveField(8)
  int? updatedAt;

  @HiveField(9)
  bool? isOwner;

  @HiveField(10)
  String? customTitle;

  @HiveField(11)
  String? memberSince;

  @HiveField(12)
  String? route;

  @HiveField(13)
  int? state;

  @HiveField(14)
  int? communityId;

  @HiveField(15)
  int? createdAt;

  LMUserHive({
    required this.id,
    required this.name,
    this.imageUrl,
    this.isGuest,
    this.isDeleted,
    required this.uuid,
    this.organisationName,
    this.sdkClientInfo,
    this.updatedAt,
    this.isOwner,
    this.customTitle,
    this.memberSince,
    this.route,
    this.state,
    this.communityId,
    this.createdAt,
  });
}

@HiveType(typeId: 3)
class LMMemberRightHive extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  bool isSelected;

  @HiveField(2)
  int state;

  @HiveField(3)
  String title;

  LMMemberRightHive({
    required this.id,
    required this.isSelected,
    required this.state,
    required this.title,
  });
}

@HiveType(typeId: 4)
class LMMemberStateHive extends HiveObject {
  @HiveField(0)
  bool editRequired;

  @HiveField(1)
  String uuid;

  @HiveField(2)
  LMUserHive? member;

  @HiveField(3)
  List<LMMemberRightHive> memberRights;

  @HiveField(4)
  int state;

  LMMemberStateHive({
    required this.editRequired,
    required this.uuid,
    this.member,
    required this.memberRights,
    required this.state,
  });
}
