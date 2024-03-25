// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CacheRO extends _CacheRO with RealmEntity, RealmObjectBase, RealmObject {
  CacheRO(
    String key,
    String value,
  ) {
    RealmObjectBase.set(this, 'key', key);
    RealmObjectBase.set(this, 'value', value);
  }

  CacheRO._();

  @override
  String get key => RealmObjectBase.get<String>(this, 'key') as String;
  @override
  set key(String value) => throw RealmUnsupportedSetError();

  @override
  String get value => RealmObjectBase.get<String>(this, 'value') as String;
  @override
  set value(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<CacheRO>> get changes =>
      RealmObjectBase.getChanges<CacheRO>(this);

  @override
  CacheRO freeze() => RealmObjectBase.freezeObject<CacheRO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CacheRO._);
    return const SchemaObject(ObjectType.realmObject, CacheRO, 'CacheRO', [
      SchemaProperty('key', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('value', RealmPropertyType.string),
    ]);
  }
}
