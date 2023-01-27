// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostRequestEntity _$GetPostRequestEntityFromJson(
        Map<String, dynamic> json) =>
    GetPostRequestEntity(
      postId: json['post_id'] as String,
      page: json['page'] as int,
      pageSize: json['page_size'] as int,
    );

Map<String, dynamic> _$GetPostRequestEntityToJson(
        GetPostRequestEntity instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
