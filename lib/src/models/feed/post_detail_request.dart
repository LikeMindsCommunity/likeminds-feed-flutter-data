import 'package:json_annotation/json_annotation.dart';

part 'post_detail_request.g.dart';

@JsonSerializable()
class PostDetailRequest {
  final String postId;
  final int page;
  // final int pageSize;

  PostDetailRequest({
    required this.postId,
    required this.page,
  });

  factory PostDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$PostDetailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostDetailRequestToJson(this);
}
