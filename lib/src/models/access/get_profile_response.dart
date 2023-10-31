import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/models/access/member_action.dart';
import 'package:likeminds_feed/src/models/access/question_answer.dart';

class GetProfileResponse {
  bool success;
  String? errorMessage;
  String? communityName;
  User? member;
  List<MemberAction>? menu;
  List<QuestionAnswer>? questionAnswer;

  GetProfileResponse({
    required this.success,
    this.errorMessage,
    this.member,
    this.communityName,
    this.menu,
    this.questionAnswer,
  });

  factory GetProfileResponse.fromEntity(GetProfileResponseEntity entity) {
    return GetProfileResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      member: entity.member != null ? User.fromEntity(entity.member!) : null,
      communityName: entity.communityName,
      menu: entity.,
      questionAnswer: entity.,
    );
  }
}

class GetProfileResponseEntity {
  bool success;
  String? errorMessage;
  UserEntity? member;
  String? communityName;
  List<MemberActionEntity>? menu;
  List<QuestionAnswerEntity>? questionAnswer;

  GetProfileResponseEntity({
    required this.success,
    this.errorMessage,
    this.member,
    this.communityName,
    this.menu, this.questionAnswer,
  });

  factory GetProfileResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetProfileResponseEntity(
      success: json['success'],
      errorMessage: json['error_message'],
      communityName: json['data']['community_name'],
      member: json['data']['member'] != null
          ? UserEntity.fromJson(json['data']['user'])
          : null,
      questionAnswer: ,
      menu: ,
    );
  }
}
