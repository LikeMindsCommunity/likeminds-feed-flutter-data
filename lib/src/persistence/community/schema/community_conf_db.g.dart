// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_conf_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class LMCommunityConfigurationRO extends _LMCommunityConfigurationRO
    with RealmEntity, RealmObjectBase, RealmObject {
  LMCommunityConfigurationRO(
    String? type, {
    String? description,
    String? value,
  }) {
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'value', value);
  }

  LMCommunityConfigurationRO._();

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get type => RealmObjectBase.get<String>(this, 'type') as String?;
  @override
  set type(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get value => RealmObjectBase.get<String>(this, 'value') as String?;
  @override
  set value(String? value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<LMCommunityConfigurationRO>> get changes =>
      RealmObjectBase.getChanges<LMCommunityConfigurationRO>(this);

  @override
  LMCommunityConfigurationRO freeze() =>
      RealmObjectBase.freezeObject<LMCommunityConfigurationRO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LMCommunityConfigurationRO._);
    return const SchemaObject(ObjectType.realmObject,
        LMCommunityConfigurationRO, 'LMCommunityConfigurationRO', [
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string,
          optional: true, primaryKey: true),
      SchemaProperty('value', RealmPropertyType.string, optional: true),
    ]);
  }
}
