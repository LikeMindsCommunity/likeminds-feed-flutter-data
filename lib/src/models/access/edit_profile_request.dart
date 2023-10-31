import 'package:likeminds_feed/src/models/access/question_community_join.dart';

class EditProfileRequest {
  String? name;
  String? imageUrl;
  String userUniqueId;
  List<QuestionCommunityJoin>? questionCommunityJoin ;

  EditProfileRequest._(
      {this.name, this.imageUrl, required this.userUniqueId});

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_url": imageUrl,
    "uuid": userUniqueId,
    "question_answer": questionCommunityJoin!.map((e) => e.toJson()).toList(),
  };
}

class EditCommunityProfileBuilder{
  String? _name;
  String? _imageUrl;
  String? _userUniqueId;

  void name(String name){
    _name = name;
  }

  void imageUrl(String imageUrl){
    _imageUrl = imageUrl;
  }

  void userUniqueId(String userUniqueId){
    _userUniqueId = userUniqueId;
  }

  EditProfileRequest build(){
    return EditProfileRequest._(
      name: _name,
      imageUrl: _imageUrl,
      userUniqueId: _userUniqueId!,
    );
  }
}
