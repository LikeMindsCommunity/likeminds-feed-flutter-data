// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LMCacheDBAdapter extends TypeAdapter<LMCacheDB> {
  @override
  final int typeId = 10;

  @override
  LMCacheDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMCacheDB(
      key: fields[0] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LMCacheDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMCacheDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
