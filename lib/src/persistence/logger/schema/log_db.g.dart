// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LMLogDBAdapter extends TypeAdapter<LMLogDB> {
  @override
  final int typeId = 40;

  @override
  LMLogDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMLogDB(
      timestamp: fields[0] as int,
      stackTrace: fields[1] as LMStackTraceDB?,
      sdkMeta: fields[2] as LMSDKMetaDB?,
      severity: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LMLogDB obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.stackTrace)
      ..writeByte(2)
      ..write(obj.sdkMeta)
      ..writeByte(3)
      ..write(obj.severity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMLogDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LMSDKMetaDBAdapter extends TypeAdapter<LMSDKMetaDB> {
  @override
  final int typeId = 41;

  @override
  LMSDKMetaDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMSDKMetaDB(
      dataLayerVersion: fields[0] as String?,
      coreVersion: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LMSDKMetaDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dataLayerVersion)
      ..writeByte(1)
      ..write(obj.coreVersion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMSDKMetaDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LMStackTraceDBAdapter extends TypeAdapter<LMStackTraceDB> {
  @override
  final int typeId = 42;

  @override
  LMStackTraceDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMStackTraceDB(
      exception: fields[0] as String,
      trace: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LMStackTraceDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.exception)
      ..writeByte(1)
      ..write(obj.trace);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMStackTraceDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
