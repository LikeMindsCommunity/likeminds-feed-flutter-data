// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_conf_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LMCommunityConfigurationDBAdapter
    extends TypeAdapter<LMCommunityConfigurationDB> {
  @override
  final int typeId = 20;

  @override
  LMCommunityConfigurationDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMCommunityConfigurationDB(
      description: fields[0] as String?,
      type: fields[1] as String?,
      value: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LMCommunityConfigurationDB obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMCommunityConfigurationDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
