// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletePostRequestEntity _$DeletePostRequestEntityFromJson(
        Map<String, dynamic> json) =>
    DeletePostRequestEntity(
      postId: json['post_id'] as String,
      deleteReason: json['delete_reason'] as String,
    );

Map<String, dynamic> _$DeletePostRequestEntityToJson(
        DeletePostRequestEntity instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'delete_reason': instance.deleteReason,
    };
