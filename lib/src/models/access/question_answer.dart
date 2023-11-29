import 'package:likeminds_feed/src/models/access/answer.dart';
import 'package:likeminds_feed/src/models/access/question.dart';

class QuestionAnswer {
  final Answer answer;
  final Question question;

  QuestionAnswer({
    required this.answer,
    required this.question,
  });

  toJson() {
    return {
      'answer': answer.toJson(),
      'question': question.toJson(),
    };
  }

  factory QuestionAnswer.fromEntity(QuestionAnswerEntity entity) {
    return QuestionAnswer(
      answer: Answer.fromEntity(entity.answer),
      question: Question.fromEntity(entity.question),
    );
  }
}

class QuestionAnswerEntity {
  final AnswerEntity answer;
  final QuestionEntity question;

  QuestionAnswerEntity({
    required this.answer,
    required this.question,
  });

  factory QuestionAnswerEntity.fromJson(Map<String, dynamic> json) {
    return QuestionAnswerEntity(
      answer: AnswerEntity.fromJson(json['answer']),
      question: QuestionEntity.fromJson(json['question']),
    );
  }
}
