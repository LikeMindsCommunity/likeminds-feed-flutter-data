// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostRequestEntity _$AddPostRequestEntityFromJson(
        Map<String, dynamic> json) =>
    AddPostRequestEntity(
      text: json['text'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedroomId: json['feedroom_id'] as int?,
    );

Map<String, dynamic> _$AddPostRequestEntityToJson(
        AddPostRequestEntity instance) =>
    <String, dynamic>{
      'text': instance.text,
      'attachments': instance.attachments,
      'feedroom_id': instance.feedroomId,
    };
