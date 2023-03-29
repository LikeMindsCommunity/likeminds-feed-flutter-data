// import 'package:json_annotation/json_annotation.dart';

// part 'tag_request_model.g.dart';

class TagRequestModel {
  final int? feedroomId;
  final int? page;
  final int? pageSize;
  final String? searchQuery;

  TagRequestModel({
    this.feedroomId,
    this.page,
    this.pageSize,
    this.searchQuery,
  });

  Map<String, dynamic> toJson() {
    return {
      'feedroom_id': feedroomId,
      'page': page,
      'page_size': pageSize,
      'search_query': searchQuery,
    };
  }

  // factory TagRequestModel.fromEntity(TagRequestEntity entity) {
  //   return TagRequestModel(
  //     feedroomId: entity.feedroomId,
  //     page: entity.page,
  //     pageSize: entity.pageSize,
  //     searchQuery: entity.searchQuery,
  //   );
  // }

  // TagRequestEntity toEntity() {
  //   return TagRequestEntity(
  //     feedroomId: feedroomId,
  //     page: page,
  //     pageSize: pageSize,
  //     searchQuery: searchQuery,
  //   );
  // }
}

// @JsonSerializable()
// class TagRequestEntity {
//   final int? page;
//   @JsonKey(name: 'page_size')
//   final int? pageSize;
//   @JsonKey(name: 'feedroom_id')
//   final int? feedroomId;
//   @JsonKey(name: 'search_query')
//   final String? searchQuery;

//   TagRequestEntity({
//     this.feedroomId,
//     this.page,
//     this.pageSize,
//     this.searchQuery,
//   });

//   factory TagRequestEntity.fromJson(Map<String, dynamic> json) =>
//       _$TagRequestEntityFromJson(json);

//   Map<String, dynamic> toJson() => _$TagRequestEntityToJson(this);
// }
