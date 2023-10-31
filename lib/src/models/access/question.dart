class Question {
  final String? id;
  final String questionTitle;
  final int state;
  final String? value;
  final bool optional;
  final String? helpText;
  final bool? field;
  final bool? isCompulsory;
  final bool? isHidden;
  final String? communityId;
  final String? memberId;
  final bool? directoryFields;
  final String? imageUrl;
  final bool? canAddOtherOptions;
  final int? questionChangeState;
  final String? tag;
  final int? rank;
  final bool isAnswerEditable;
  final int? dropdownSelectionLimit;

  Question({
    this.id,
    required this.questionTitle,
    required this.state,
    this.value,
    required this.optional,
    this.helpText,
    this.field,
    this.isCompulsory,
    this.isHidden,
    this.communityId,
    this.memberId,
    this.directoryFields,
    this.imageUrl,
    this.canAddOtherOptions,
    this.questionChangeState,
    this.tag,
    this.rank,
    required this.isAnswerEditable,
    this.dropdownSelectionLimit,
  });

  toJson() => {
        'id': id,
        'question_title': questionTitle,
        'state': state,
        'value': value,
        'optional': optional,
        'help_text': helpText,
        'field': field,
        'is_compulsory': isCompulsory,
        'is_hidden': isHidden,
        'community_id': communityId,
        'member_id': memberId,
        'directory_fields': directoryFields,
        'image_url': imageUrl,
        'can_add_options': canAddOtherOptions,
        'question_change_state': questionChangeState,
        'tag': tag,
        'rank': rank,
        'is_answer_editable': isAnswerEditable,
        'dropdown_selection_limit': dropdownSelectionLimit,
      };

  factory Question.fromEntity(QuestionEntity entity) {
    return Question(
      id: entity.id,
      questionTitle: entity.questionTitle,
      state: entity.state,
      value: entity.value,
      optional: entity.optional,
      helpText: entity.helpText,
      field: entity.field,
      isCompulsory: entity.isCompulsory,
      isHidden: entity.isHidden,
      communityId: entity.communityId,
      memberId: entity.memberId,
      directoryFields: entity.directoryFields,
      imageUrl: entity.imageUrl,
      canAddOtherOptions: entity.canAddOtherOptions,
      questionChangeState: entity.questionChangeState,
      tag: entity.tag,
      rank: entity.rank,
      isAnswerEditable: entity.isAnswerEditable,
      dropdownSelectionLimit: entity.dropdownSelectionLimit,
    );
  }
}

class QuestionEntity {
  final String? id;
  final String questionTitle;
  final int state;
  final String? value;
  final bool optional;
  final String? helpText;
  final bool? field;
  final bool? isCompulsory;
  final bool? isHidden;
  final String? communityId;
  final String? memberId;
  final bool? directoryFields;
  final String? imageUrl;
  final bool? canAddOtherOptions;
  final int? questionChangeState;
  final String? tag;
  final int? rank;
  final bool isAnswerEditable;
  final int? dropdownSelectionLimit;

  QuestionEntity({
    this.id,
    required this.questionTitle,
    required this.state,
    this.value,
    required this.optional,
    this.helpText,
    this.field,
    this.isCompulsory,
    this.isHidden,
    this.communityId,
    this.memberId,
    this.directoryFields,
    this.imageUrl,
    this.canAddOtherOptions,
    this.questionChangeState,
    this.tag,
    this.rank,
    required this.isAnswerEditable,
    this.dropdownSelectionLimit,
  });

  factory QuestionEntity.fromJson(Map<String, dynamic> json) {
    return QuestionEntity(
      id: json['id'],
      questionTitle: json['question_title'],
      state: json['state'],
      value: json['value'],
      optional: json['optional'],
      helpText: json['help_text'],
      field: json['field'],
      isCompulsory: json['is_compulsory'],
      isHidden: json['is_hidden'],
      communityId: json['community_id'],
      memberId: json['member_id'],
      directoryFields: json['directory_fields'],
      imageUrl: json['image_url'],
      canAddOtherOptions: json['can_add_options'],
      questionChangeState: json['question_change_state'],
      tag: json['tag'],
      rank: json['rank'],
      isAnswerEditable: json['is_answer_editable'],
      dropdownSelectionLimit: json['dropdown_selection_limit'],
    );
  }
}
