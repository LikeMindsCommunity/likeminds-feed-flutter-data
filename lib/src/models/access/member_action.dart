class MemberAction {
  final String title;
  final String route;

  MemberAction({
    required this.title,
    required this.route,
  });

  factory MemberAction.fromEntity(MemberActionEntity entity) {
    return MemberAction(
      title: entity.title,
      route: entity.route,
    );
  }
}

class MemberActionEntity {
  final String title;
  final String route;

  MemberActionEntity({
    required this.title,
    required this.route,
  });

  factory MemberActionEntity.fromJson(Map<String, dynamic> json) {
    return MemberActionEntity(
      title: json['title'],
      route: json['route'],
    );
  }
}
