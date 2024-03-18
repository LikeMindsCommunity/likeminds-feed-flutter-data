// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class LMLogDBModel extends _LMLogDBModel
    with RealmEntity, RealmObjectBase, RealmObject {
  LMLogDBModel(
    int timestamp,
    String severity, {
    LMStackTraceDBModel? stackTrace,
    LMSDKMetaDBModel? sdkMeta,
  }) {
    RealmObjectBase.set(this, 'timestamp', timestamp);
    RealmObjectBase.set(this, 'stack_trace', stackTrace);
    RealmObjectBase.set(this, 'sdk_meta', sdkMeta);
    RealmObjectBase.set(this, 'severity', severity);
  }

  LMLogDBModel._();

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => throw RealmUnsupportedSetError();

  @override
  LMStackTraceDBModel? get stackTrace =>
      RealmObjectBase.get<LMStackTraceDBModel>(this, 'stack_trace')
          as LMStackTraceDBModel?;
  @override
  set stackTrace(covariant LMStackTraceDBModel? value) =>
      throw RealmUnsupportedSetError();

  @override
  LMSDKMetaDBModel? get sdkMeta =>
      RealmObjectBase.get<LMSDKMetaDBModel>(this, 'sdk_meta')
          as LMSDKMetaDBModel?;
  @override
  set sdkMeta(covariant LMSDKMetaDBModel? value) =>
      throw RealmUnsupportedSetError();

  @override
  String get severity =>
      RealmObjectBase.get<String>(this, 'severity') as String;
  @override
  set severity(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<LMLogDBModel>> get changes =>
      RealmObjectBase.getChanges<LMLogDBModel>(this);

  @override
  LMLogDBModel freeze() => RealmObjectBase.freezeObject<LMLogDBModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LMLogDBModel._);
    return const SchemaObject(
        ObjectType.realmObject, LMLogDBModel, 'LMLogDBModel', [
      SchemaProperty('timestamp', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('stackTrace', RealmPropertyType.object,
          mapTo: 'stack_trace',
          optional: true,
          linkTarget: 'LMStackTraceDBModel'),
      SchemaProperty('sdkMeta', RealmPropertyType.object,
          mapTo: 'sdk_meta', optional: true, linkTarget: 'LMSDKMetaDBModel'),
      SchemaProperty('severity', RealmPropertyType.string),
    ]);
  }
}

class LMSDKMetaDBModel extends _LMSDKMetaDBModel
    with RealmEntity, RealmObjectBase, RealmObject {
  LMSDKMetaDBModel({
    String? sampleAppVersion,
    String? uiVersion,
    String? middlewareVersion,
  }) {
    RealmObjectBase.set(this, 'sample_app_version', sampleAppVersion);
    RealmObjectBase.set(this, 'ui_version', uiVersion);
    RealmObjectBase.set(this, 'middleware_version', middlewareVersion);
  }

  LMSDKMetaDBModel._();

  @override
  String? get sampleAppVersion =>
      RealmObjectBase.get<String>(this, 'sample_app_version') as String?;
  @override
  set sampleAppVersion(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get uiVersion =>
      RealmObjectBase.get<String>(this, 'ui_version') as String?;
  @override
  set uiVersion(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get middlewareVersion =>
      RealmObjectBase.get<String>(this, 'middleware_version') as String?;
  @override
  set middlewareVersion(String? value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<LMSDKMetaDBModel>> get changes =>
      RealmObjectBase.getChanges<LMSDKMetaDBModel>(this);

  @override
  LMSDKMetaDBModel freeze() =>
      RealmObjectBase.freezeObject<LMSDKMetaDBModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LMSDKMetaDBModel._);
    return const SchemaObject(
        ObjectType.realmObject, LMSDKMetaDBModel, 'LMSDKMetaDBModel', [
      SchemaProperty('sampleAppVersion', RealmPropertyType.string,
          mapTo: 'sample_app_version', optional: true),
      SchemaProperty('uiVersion', RealmPropertyType.string,
          mapTo: 'ui_version', optional: true),
      SchemaProperty('middlewareVersion', RealmPropertyType.string,
          mapTo: 'middleware_version', optional: true),
    ]);
  }
}

class LMStackTraceDBModel extends _LMStackTraceDBModel
    with RealmEntity, RealmObjectBase, RealmObject {
  LMStackTraceDBModel(
    String exception,
    String trace,
  ) {
    RealmObjectBase.set(this, 'exception', exception);
    RealmObjectBase.set(this, 'trace', trace);
  }

  LMStackTraceDBModel._();

  @override
  String get exception =>
      RealmObjectBase.get<String>(this, 'exception') as String;
  @override
  set exception(String value) => throw RealmUnsupportedSetError();

  @override
  String get trace => RealmObjectBase.get<String>(this, 'trace') as String;
  @override
  set trace(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<LMStackTraceDBModel>> get changes =>
      RealmObjectBase.getChanges<LMStackTraceDBModel>(this);

  @override
  LMStackTraceDBModel freeze() =>
      RealmObjectBase.freezeObject<LMStackTraceDBModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LMStackTraceDBModel._);
    return const SchemaObject(
        ObjectType.realmObject, LMStackTraceDBModel, 'LMStackTraceDBModel', [
      SchemaProperty('exception', RealmPropertyType.string),
      SchemaProperty('trace', RealmPropertyType.string),
    ]);
  }
}
