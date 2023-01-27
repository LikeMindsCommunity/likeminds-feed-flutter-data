// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetailResponseEntity _$PostDetailResponseEntityFromJson(
        Map<String, dynamic> json) =>
    PostDetailResponseEntity(
      postReplies:
          PostRepliesEntity.fromJson(json['post'] as Map<String, dynamic>),
      users: (json['users'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, PostUserEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$PostDetailResponseEntityToJson(
        PostDetailResponseEntity instance) =>
    <String, dynamic>{
      'post': instance.postReplies.toJson(),
      'users': instance.users.map((k, e) => MapEntry(k, e.toJson())),
    };
