// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetailRequest _$PostDetailRequestFromJson(Map<String, dynamic> json) =>
    PostDetailRequest(
      postId: json['postId'] as String,
      page: json['page'] as int,
    );

Map<String, dynamic> _$PostDetailRequestToJson(PostDetailRequest instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'page': instance.page,
    };
