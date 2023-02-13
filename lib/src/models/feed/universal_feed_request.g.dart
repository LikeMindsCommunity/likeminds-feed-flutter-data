// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'universal_feed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversalFeedRequest _$UniversalFeedRequestFromJson(
        Map<String, dynamic> json) =>
    UniversalFeedRequest(
      page: json['page'] as int,
      pageSize: json['page_size'] as int,
    );

Map<String, dynamic> _$UniversalFeedRequestToJson(
        UniversalFeedRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
    };
