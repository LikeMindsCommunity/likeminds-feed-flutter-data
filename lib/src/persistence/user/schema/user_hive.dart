import 'package:hive/hive.dart';

part 'user_hive.g.dart';

@HiveType(typeId: 31)
class LMSDKClientInfoDB extends HiveObject {
  @HiveField(0)
  int community;

  @HiveField(1)
  int user;

  @HiveField(2)
  String uuid;

  LMSDKClientInfoDB({
    required this.community,
    required this.user,
    required this.uuid,
  });
}

@HiveType(typeId: 30)
class LMUserDB extends HiveObject {
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
  LMSDKClientInfoDB? sdkClientInfo;

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

  LMUserDB({
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

@HiveType(typeId: 32)
class LMMemberRightDB extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  bool isSelected;

  @HiveField(2)
  int state;

  @HiveField(3)
  String title;

  LMMemberRightDB({
    required this.id,
    required this.isSelected,
    required this.state,
    required this.title,
  });
}

@HiveType(typeId: 33)
class LMMemberStateDB extends HiveObject {
  @HiveField(0)
  bool editRequired;

  @HiveField(1)
  String uuid;

  @HiveField(2)
  LMUserDB? member;

  @HiveField(3)
  List<LMMemberRightDB> memberRights;

  @HiveField(4)
  int state;

  LMMemberStateDB({
    required this.editRequired,
    required this.uuid,
    this.member,
    required this.memberRights,
    required this.state,
  });
}
