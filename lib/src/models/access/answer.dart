class Answer {
  final String answer;
  final int memberId;
  final int questionId;
  final int communityId;
  final String? imageUrl;

  Answer({
    required this.answer,
    required this.memberId,
    required this.questionId,
    required this.communityId,
    this.imageUrl,
  });

  toJson() {
    return {
      'answer': answer,
      'member_id': memberId,
      'question_id': questionId,
      'community_id': communityId,
      'image_url': imageUrl,
    };
  }

  factory Answer.fromEntity(AnswerEntity entity) {
    return Answer(
      answer: entity.answer,
      memberId: entity.memberId,
      questionId: entity.questionId,
      communityId: entity.communityId,
      imageUrl: entity.imageUrl,
    );
  }
}

class AnswerEntity {
  final String answer;
  final int memberId;
  final int questionId;
  final int communityId;
  final String? imageUrl;

  AnswerEntity({
    required this.answer,
    required this.memberId,
    required this.questionId,
    required this.communityId,
    this.imageUrl,
  });

  factory AnswerEntity.fromJson(Map<String, dynamic> json) {
    return AnswerEntity(
      answer: json['answer'],
      memberId: json['member_id'],
      questionId: json['question_id'],
      communityId: json['community_id'],
      imageUrl: json['image_url'],
    );
  }
}
