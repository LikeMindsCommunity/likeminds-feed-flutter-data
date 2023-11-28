import 'package:likeminds_feed/likeminds_feed.dart';

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
      menu: entity.menu?.map((e) => MemberAction.fromEntity(e)).toList(),
      questionAnswer: entity.questionAnswer
          ?.map((e) => QuestionAnswer.fromEntity(e))
          .toList(),
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
    this.menu,
    this.questionAnswer,
  });

  factory GetProfileResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetProfileResponseEntity(
      success: json['success'],
      errorMessage: json['error_message'],
      communityName: json['data']['community_name'],
      member: json['data']['member'] != null
          ? UserEntity.fromJson(json['data']['member'])
          : null,
      questionAnswer: json['data']['question_answer'] != null
          ? List<QuestionAnswerEntity>.from(json['data']['question_answer']
              .map((x) => QuestionAnswerEntity.fromJson(x)))
          : null,
      menu: json['data']['menu'] != null
          ? List<MemberActionEntity>.from(
              json['data']['menu'].map((x) => MemberActionEntity.fromJson(x)))
          : null,
    );
  }
}
