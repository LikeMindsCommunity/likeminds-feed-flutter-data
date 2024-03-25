import 'package:likeminds_feed/src/models/access/question_community_join.dart';

class EditProfileRequest {
  String? name;
  String? imageUrl;
  String uuid;
  List<QuestionCommunityJoin>? questionCommunityJoin;
  Map<String, dynamic>? metadata;

  EditProfileRequest._({
    this.name,
    this.imageUrl,
    required this.uuid,
    this.questionCommunityJoin,
    this.metadata,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "image_url": imageUrl,
        "uuid": uuid,
        "question_answer":
            questionCommunityJoin?.map((e) => e.toJson()).toList(),
        "metadata": metadata,
      };
}

class EditProfileRequestBuilder {
  String? _name;
  String? _imageUrl;
  String? _uuid;
  List<QuestionCommunityJoin>? _questionCommunityJoin;
  Map<String, dynamic>? _metadata;

  void name(String name) {
    _name = name;
  }

  void imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  void uuid(String uuid) {
    _uuid = uuid;
  }

  void questionCommunityJoin(
      List<QuestionCommunityJoin> questionCommunityJoin) {
    _questionCommunityJoin = questionCommunityJoin;
  }

  void metadata(Map<String, dynamic> metadata) {
    _metadata = metadata;
  }

  EditProfileRequest build() {
    return EditProfileRequest._(
      name: _name,
      imageUrl: _imageUrl,
      uuid: _uuid!,
      questionCommunityJoin: _questionCommunityJoin,
      metadata: _metadata,
    );
  }
}
