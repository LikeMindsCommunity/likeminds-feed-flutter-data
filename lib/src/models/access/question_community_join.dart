class QuestionCommunityJoin {
  final int? questionId;
  final String? answer;

  QuestionCommunityJoin._({
    this.questionId,
    this.answer,
  });

  toJson() {
    return {
      'question_id': questionId,
      'answer': answer,
    };
  }
}

class QuestionCommunityJoinBuilder{
  int? _questionId;
  String? _answer;

  void questionId(int questionId) {
    _questionId = questionId;
  }

  void answer(String answer) {
    _answer = answer;
  }

  QuestionCommunityJoin build() {
    return QuestionCommunityJoin._(
      questionId: _questionId,
      answer: _answer,
    );
  }
}
