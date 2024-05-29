// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LMSDKClientInfoHiveAdapter extends TypeAdapter<LMSDKClientInfoHive> {
  @override
  final int typeId = 31;

  @override
  LMSDKClientInfoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMSDKClientInfoHive(
      community: fields[0] as int,
      user: fields[1] as int,
      uuid: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LMSDKClientInfoHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.community)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMSDKClientInfoHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LMUserHiveAdapter extends TypeAdapter<LMUserHive> {
  @override
  final int typeId = 30;

  @override
  LMUserHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMUserHive(
      id: fields[0] as int,
      name: fields[1] as String,
      imageUrl: fields[2] as String?,
      isGuest: fields[3] as bool?,
      isDeleted: fields[4] as bool?,
      uuid: fields[5] as String,
      organisationName: fields[6] as String?,
      sdkClientInfo: fields[7] as LMSDKClientInfoHive?,
      updatedAt: fields[8] as int?,
      isOwner: fields[9] as bool?,
      customTitle: fields[10] as String?,
      memberSince: fields[11] as String?,
      route: fields[12] as String?,
      state: fields[13] as int?,
      communityId: fields[14] as int?,
      createdAt: fields[15] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LMUserHive obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.isGuest)
      ..writeByte(4)
      ..write(obj.isDeleted)
      ..writeByte(5)
      ..write(obj.uuid)
      ..writeByte(6)
      ..write(obj.organisationName)
      ..writeByte(7)
      ..write(obj.sdkClientInfo)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.isOwner)
      ..writeByte(10)
      ..write(obj.customTitle)
      ..writeByte(11)
      ..write(obj.memberSince)
      ..writeByte(12)
      ..write(obj.route)
      ..writeByte(13)
      ..write(obj.state)
      ..writeByte(14)
      ..write(obj.communityId)
      ..writeByte(15)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMUserHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LMMemberRightHiveAdapter extends TypeAdapter<LMMemberRightHive> {
  @override
  final int typeId = 32;

  @override
  LMMemberRightHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMMemberRightHive(
      id: fields[0] as int,
      isSelected: fields[1] as bool,
      state: fields[2] as int,
      title: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LMMemberRightHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isSelected)
      ..writeByte(2)
      ..write(obj.state)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMMemberRightHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LMMemberStateHiveAdapter extends TypeAdapter<LMMemberStateHive> {
  @override
  final int typeId = 33;

  @override
  LMMemberStateHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMMemberStateHive(
      editRequired: fields[0] as bool,
      uuid: fields[1] as String,
      member: fields[2] as LMUserHive?,
      memberRights: (fields[3] as List).cast<LMMemberRightHive>(),
      state: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LMMemberStateHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.editRequired)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.member)
      ..writeByte(3)
      ..write(obj.memberRights)
      ..writeByte(4)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMMemberStateHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
