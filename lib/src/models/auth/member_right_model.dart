class MemberRight {
  final int id;
  final bool isSelected;
  final int state;
  final String title;

  MemberRight({
    required this.id,
    required this.isSelected,
    required this.state,
    required this.title,
  });

  factory MemberRight.fromJson(Map<String, dynamic> json) {
    return MemberRight(
      id: json['id'],
      isSelected: json['is_selected'],
      state: json['state'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_selected': isSelected,
      'state': state,
      'title': title,
    };
  }
}
