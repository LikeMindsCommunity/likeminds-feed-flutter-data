import 'package:likeminds_feed/src/models/access/question_community_join.dart';

class EditProfileRequest {
  String? name;
  String? imageUrl;
  String userUniqueId;
  List<QuestionCommunityJoin>? questionCommunityJoin;
  Map<String, dynamic>? metadata;

  EditProfileRequest._({
    this.name,
    this.imageUrl,
    required this.userUniqueId,
    this.questionCommunityJoin,
    this.metadata,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "image_url": imageUrl,
        "uuid": userUniqueId,
        "question_answer":
            questionCommunityJoin?.map((e) => e.toJson()).toList(),
        "metadata": metadata,
      };
}

class EditProfileRequestBuilder {
  String? _name;
  String? _imageUrl;
  String? _userUniqueId;
  List<QuestionCommunityJoin>? _questionCommunityJoin;
  Map<String, dynamic>? _metadata;

  void name(String name) {
    _name = name;
  }

  void imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  void userUniqueId(String userUniqueId) {
    _userUniqueId = userUniqueId;
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
      userUniqueId: _userUniqueId!,
      questionCommunityJoin: _questionCommunityJoin,
      metadata: _metadata,
    );
  }
}
