import 'package:json_annotation/json_annotation.dart';

part 'universal_feed_request.g.dart';

@JsonSerializable()
class UniversalFeedRequest {
  final int page;
  final int pageSize;

  UniversalFeedRequest({
    required this.page,
    required this.pageSize,
  });

  factory UniversalFeedRequest.fromJson(Map<String, dynamic> json) =>
      _$UniversalFeedRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UniversalFeedRequestToJson(this);
}
