// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_post_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LMTempPostDBAdapter extends TypeAdapter<LMTempPostDB> {
  @override
  final int typeId = 60;

  @override
  LMTempPostDB read(BinaryReader reader) {
    return LMTempPostDB();
  }

  @override
  void write(BinaryWriter writer, LMTempPostDB obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMTempPostDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LMPostDBAdapter extends TypeAdapter<LMPostDB> {
  @override
  final int typeId = 61;

  @override
  LMPostDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMPostDB(
      id: fields[0] as String,
      uuid: fields[1] as String,
      communityId: fields[2] as int,
      tempId: fields[3] as String?,
      text: fields[4] as String,
      heading: fields[5] as String?,
      commentIds: (fields[6] as List?)?.cast<String>(),
      topicIds: (fields[7] as List?)?.cast<String>(),
      attachments: (fields[8] as List?)?.cast<LMAttachmentDB>(),
      likeCount: fields[9] as int,
      commentCount: fields[10] as int,
      repostCount: fields[11] as int,
      createdAt: fields[12] as DateTime,
      updatedAt: fields[13] as DateTime,
      isLiked: fields[14] as bool,
      isPinned: fields[15] as bool,
      isSaved: fields[16] as bool,
      isEdited: fields[17] as bool,
      isDeleted: fields[18] as bool?,
      isRepost: fields[19] as bool,
      isRepostedByUser: fields[20] as bool,
      isPendingPost: fields[21] as bool,
      postStatus: fields[22] as String,
      feedroomId: fields[23] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LMPostDB obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.communityId)
      ..writeByte(3)
      ..write(obj.tempId)
      ..writeByte(4)
      ..write(obj.text)
      ..writeByte(5)
      ..write(obj.heading)
      ..writeByte(6)
      ..write(obj.commentIds)
      ..writeByte(7)
      ..write(obj.topicIds)
      ..writeByte(8)
      ..write(obj.attachments)
      ..writeByte(9)
      ..write(obj.likeCount)
      ..writeByte(10)
      ..write(obj.commentCount)
      ..writeByte(11)
      ..write(obj.repostCount)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt)
      ..writeByte(14)
      ..write(obj.isLiked)
      ..writeByte(15)
      ..write(obj.isPinned)
      ..writeByte(16)
      ..write(obj.isSaved)
      ..writeByte(17)
      ..write(obj.isEdited)
      ..writeByte(18)
      ..write(obj.isDeleted)
      ..writeByte(19)
      ..write(obj.isRepost)
      ..writeByte(20)
      ..write(obj.isRepostedByUser)
      ..writeByte(21)
      ..write(obj.isPendingPost)
      ..writeByte(22)
      ..write(obj.postStatus)
      ..writeByte(23)
      ..write(obj.feedroomId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMPostDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LMAttachmentDBAdapter extends TypeAdapter<LMAttachmentDB> {
  @override
  final int typeId = 63;

  @override
  LMAttachmentDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMAttachmentDB(
      attachmentType: fields[0] as int,
      attachmentMeta: fields[1] as LMAttachmentMetaDB,
    );
  }

  @override
  void write(BinaryWriter writer, LMAttachmentDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.attachmentType)
      ..writeByte(1)
      ..write(obj.attachmentMeta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMAttachmentDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LMAttachmentMetaDBAdapter extends TypeAdapter<LMAttachmentMetaDB> {
  @override
  final int typeId = 64;

  @override
  LMAttachmentMetaDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMAttachmentMetaDB(
      url: fields[0] as String?,
      format: fields[1] as String?,
      size: fields[2] as int?,
      duration: fields[3] as int?,
      pageCount: fields[4] as int?,
      height: fields[5] as int?,
      width: fields[6] as int?,
      aspectRatio: fields[7] as double?,
      meta: (fields[8] as Map?)?.cast<String, dynamic>(),
      entityId: fields[9] as String?,
      pollQuestion: fields[10] as String?,
      expiryTime: fields[11] as int?,
      pollOptions: (fields[12] as List?)?.cast<String>(),
      multiSelectState: fields[13] as String?,
      pollType: fields[14] as String?,
      multiSelectNo: fields[15] as int?,
      isAnonymous: fields[16] as bool?,
      allowAddOption: fields[17] as bool?,
      thumbnailUrl: fields[18] as String?,
      path: fields[19] as String?,
      bytes: fields[20] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, LMAttachmentMetaDB obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.format)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.pageCount)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.width)
      ..writeByte(7)
      ..write(obj.aspectRatio)
      ..writeByte(8)
      ..write(obj.meta)
      ..writeByte(9)
      ..write(obj.entityId)
      ..writeByte(10)
      ..write(obj.pollQuestion)
      ..writeByte(11)
      ..write(obj.expiryTime)
      ..writeByte(12)
      ..write(obj.pollOptions)
      ..writeByte(13)
      ..write(obj.multiSelectState)
      ..writeByte(14)
      ..write(obj.pollType)
      ..writeByte(15)
      ..write(obj.multiSelectNo)
      ..writeByte(16)
      ..write(obj.isAnonymous)
      ..writeByte(17)
      ..write(obj.allowAddOption)
      ..writeByte(18)
      ..write(obj.thumbnailUrl)
      ..writeByte(19)
      ..write(obj.path)
      ..writeByte(20)
      ..write(obj.bytes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMAttachmentMetaDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
