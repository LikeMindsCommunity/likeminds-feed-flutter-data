// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_likes_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostLikesRequestEntity _$GetPostLikesRequestEntityFromJson(
        Map<String, dynamic> json) =>
    GetPostLikesRequestEntity(
      postId: json['post_id'] as String,
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$GetPostLikesRequestEntityToJson(
        GetPostLikesRequestEntity instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
