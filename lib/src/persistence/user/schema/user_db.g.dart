// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class LMSDKClientInfoRO extends _LMSDKClientInfoRO
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  LMSDKClientInfoRO(
    int community,
    int user,
    String uuid,
  ) {
    RealmObjectBase.set(this, 'community', community);
    RealmObjectBase.set(this, 'user', user);
    RealmObjectBase.set(this, 'uuid', uuid);
  }

  LMSDKClientInfoRO._();

  @override
  int get community => RealmObjectBase.get<int>(this, 'community') as int;
  @override
  set community(int value) => throw RealmUnsupportedSetError();

  @override
  int get user => RealmObjectBase.get<int>(this, 'user') as int;
  @override
  set user(int value) => throw RealmUnsupportedSetError();

  @override
  String get uuid => RealmObjectBase.get<String>(this, 'uuid') as String;
  @override
  set uuid(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<LMSDKClientInfoRO>> get changes =>
      RealmObjectBase.getChanges<LMSDKClientInfoRO>(this);

  @override
  LMSDKClientInfoRO freeze() =>
      RealmObjectBase.freezeObject<LMSDKClientInfoRO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LMSDKClientInfoRO._);
    return const SchemaObject(
        ObjectType.embeddedObject, LMSDKClientInfoRO, 'LMSDKClientInfoRO', [
      SchemaProperty('community', RealmPropertyType.int),
      SchemaProperty('user', RealmPropertyType.int),
      SchemaProperty('uuid', RealmPropertyType.string),
    ]);
  }
}

class LMUserRO extends _LMUserRO
    with RealmEntity, RealmObjectBase, RealmObject {
  LMUserRO(
    int id,
    String name,
    String uuid, {
    String? imageUrl,
    bool? isGuest,
    bool? isDeleted,
    String? organisationName,
    LMSDKClientInfoRO? sdkClientInfo,
    int? updatedAt,
    bool? isOwner,
    String? customTitle,
    String? memberSince,
    String? route,
    int? state,
    int? communityId,
    int? createdAt,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'image_url', imageUrl);
    RealmObjectBase.set(this, 'is_guest', isGuest);
    RealmObjectBase.set(this, 'is_deleted', isDeleted);
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'organisation_name', organisationName);
    RealmObjectBase.set(this, 'sdk_client_info', sdkClientInfo);
    RealmObjectBase.set(this, 'updated_at', updatedAt);
    RealmObjectBase.set(this, 'is_owner', isOwner);
    RealmObjectBase.set(this, 'custom_title', customTitle);
    RealmObjectBase.set(this, 'member_since', memberSince);
    RealmObjectBase.set(this, 'route', route);
    RealmObjectBase.set(this, 'state', state);
    RealmObjectBase.set(this, 'community_id', communityId);
    RealmObjectBase.set(this, 'created_at', createdAt);
  }

  LMUserRO._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => throw RealmUnsupportedSetError();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => throw RealmUnsupportedSetError();

  @override
  String? get imageUrl =>
      RealmObjectBase.get<String>(this, 'image_url') as String?;
  @override
  set imageUrl(String? value) => throw RealmUnsupportedSetError();

  @override
  bool? get isGuest => RealmObjectBase.get<bool>(this, 'is_guest') as bool?;
  @override
  set isGuest(bool? value) => throw RealmUnsupportedSetError();

  @override
  bool? get isDeleted => RealmObjectBase.get<bool>(this, 'is_deleted') as bool?;
  @override
  set isDeleted(bool? value) => throw RealmUnsupportedSetError();

  @override
  String get uuid => RealmObjectBase.get<String>(this, 'uuid') as String;
  @override
  set uuid(String value) => throw RealmUnsupportedSetError();

  @override
  String? get organisationName =>
      RealmObjectBase.get<String>(this, 'organisation_name') as String?;
  @override
  set organisationName(String? value) => throw RealmUnsupportedSetError();

  @override
  LMSDKClientInfoRO? get sdkClientInfo =>
      RealmObjectBase.get<LMSDKClientInfoRO>(this, 'sdk_client_info')
          as LMSDKClientInfoRO?;
  @override
  set sdkClientInfo(covariant LMSDKClientInfoRO? value) =>
      throw RealmUnsupportedSetError();

  @override
  int? get updatedAt => RealmObjectBase.get<int>(this, 'updated_at') as int?;
  @override
  set updatedAt(int? value) => throw RealmUnsupportedSetError();

  @override
  bool? get isOwner => RealmObjectBase.get<bool>(this, 'is_owner') as bool?;
  @override
  set isOwner(bool? value) => throw RealmUnsupportedSetError();

  @override
  String? get customTitle =>
      RealmObjectBase.get<String>(this, 'custom_title') as String?;
  @override
  set customTitle(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get memberSince =>
      RealmObjectBase.get<String>(this, 'member_since') as String?;
  @override
  set memberSince(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get route => RealmObjectBase.get<String>(this, 'route') as String?;
  @override
  set route(String? value) => throw RealmUnsupportedSetError();

  @override
  int? get state => RealmObjectBase.get<int>(this, 'state') as int?;
  @override
  set state(int? value) => throw RealmUnsupportedSetError();

  @override
  int? get communityId =>
      RealmObjectBase.get<int>(this, 'community_id') as int?;
  @override
  set communityId(int? value) => throw RealmUnsupportedSetError();

  @override
  int? get createdAt => RealmObjectBase.get<int>(this, 'created_at') as int?;
  @override
  set createdAt(int? value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<LMUserRO>> get changes =>
      RealmObjectBase.getChanges<LMUserRO>(this);

  @override
  LMUserRO freeze() => RealmObjectBase.freezeObject<LMUserRO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LMUserRO._);
    return const SchemaObject(ObjectType.realmObject, LMUserRO, 'LMUserRO', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('imageUrl', RealmPropertyType.string,
          mapTo: 'image_url', optional: true),
      SchemaProperty('isGuest', RealmPropertyType.bool,
          mapTo: 'is_guest', optional: true),
      SchemaProperty('isDeleted', RealmPropertyType.bool,
          mapTo: 'is_deleted', optional: true),
      SchemaProperty('uuid', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('organisationName', RealmPropertyType.string,
          mapTo: 'organisation_name', optional: true),
      SchemaProperty('sdkClientInfo', RealmPropertyType.object,
          mapTo: 'sdk_client_info',
          optional: true,
          linkTarget: 'LMSDKClientInfoRO'),
      SchemaProperty('updatedAt', RealmPropertyType.int,
          mapTo: 'updated_at', optional: true),
      SchemaProperty('isOwner', RealmPropertyType.bool,
          mapTo: 'is_owner', optional: true),
      SchemaProperty('customTitle', RealmPropertyType.string,
          mapTo: 'custom_title', optional: true),
      SchemaProperty('memberSince', RealmPropertyType.string,
          mapTo: 'member_since', optional: true),
      SchemaProperty('route', RealmPropertyType.string, optional: true),
      SchemaProperty('state', RealmPropertyType.int, optional: true),
      SchemaProperty('communityId', RealmPropertyType.int,
          mapTo: 'community_id', optional: true),
      SchemaProperty('createdAt', RealmPropertyType.int,
          mapTo: 'created_at', optional: true),
    ]);
  }
}

class LMMemberRightRO extends _LMMemberRightRO
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  LMMemberRightRO(
    int id,
    bool isSelected,
    int state,
    String title,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'is_selected', isSelected);
    RealmObjectBase.set(this, 'state', state);
    RealmObjectBase.set(this, 'title', title);
  }

  LMMemberRightRO._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => throw RealmUnsupportedSetError();

  @override
  bool get isSelected => RealmObjectBase.get<bool>(this, 'is_selected') as bool;
  @override
  set isSelected(bool value) => throw RealmUnsupportedSetError();

  @override
  int get state => RealmObjectBase.get<int>(this, 'state') as int;
  @override
  set state(int value) => throw RealmUnsupportedSetError();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<LMMemberRightRO>> get changes =>
      RealmObjectBase.getChanges<LMMemberRightRO>(this);

  @override
  LMMemberRightRO freeze() =>
      RealmObjectBase.freezeObject<LMMemberRightRO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LMMemberRightRO._);
    return const SchemaObject(
        ObjectType.embeddedObject, LMMemberRightRO, 'LMMemberRightRO', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('isSelected', RealmPropertyType.bool,
          mapTo: 'is_selected'),
      SchemaProperty('state', RealmPropertyType.int),
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }
}

class LMMemberStateRO extends _LMMemberStateRO
    with RealmEntity, RealmObjectBase, RealmObject {
  LMMemberStateRO(
    bool editRequired,
    int state, {
    LMUserRO? member,
    Iterable<LMMemberRightRO> memberRights = const [],
  }) {
    RealmObjectBase.set(this, 'edit_required', editRequired);
    RealmObjectBase.set(this, 'member', member);
    RealmObjectBase.set(this, 'state', state);
    RealmObjectBase.set<RealmList<LMMemberRightRO>>(
        this, 'member_rights', RealmList<LMMemberRightRO>(memberRights));
  }

  LMMemberStateRO._();

  @override
  bool get editRequired =>
      RealmObjectBase.get<bool>(this, 'edit_required') as bool;
  @override
  set editRequired(bool value) => throw RealmUnsupportedSetError();

  @override
  LMUserRO? get member =>
      RealmObjectBase.get<LMUserRO>(this, 'member') as LMUserRO?;
  @override
  set member(covariant LMUserRO? value) => throw RealmUnsupportedSetError();

  @override
  RealmList<LMMemberRightRO> get memberRights =>
      RealmObjectBase.get<LMMemberRightRO>(this, 'member_rights')
          as RealmList<LMMemberRightRO>;
  @override
  set memberRights(covariant RealmList<LMMemberRightRO> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get state => RealmObjectBase.get<int>(this, 'state') as int;
  @override
  set state(int value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<LMMemberStateRO>> get changes =>
      RealmObjectBase.getChanges<LMMemberStateRO>(this);

  @override
  LMMemberStateRO freeze() =>
      RealmObjectBase.freezeObject<LMMemberStateRO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LMMemberStateRO._);
    return const SchemaObject(
        ObjectType.realmObject, LMMemberStateRO, 'LMMemberStateRO', [
      SchemaProperty('editRequired', RealmPropertyType.bool,
          mapTo: 'edit_required'),
      SchemaProperty('member', RealmPropertyType.object,
          optional: true, linkTarget: 'LMUserRO'),
      SchemaProperty('memberRights', RealmPropertyType.object,
          mapTo: 'member_rights',
          linkTarget: 'LMMemberRightRO',
          collectionType: RealmCollectionType.list),
      SchemaProperty('state', RealmPropertyType.int),
    ]);
  }
}
