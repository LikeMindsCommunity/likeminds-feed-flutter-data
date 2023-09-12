class Topic {
  final String name;
  final String id;
  final bool isEnabled;

  Topic._({required this.name, required this.id, required this.isEnabled});

  factory Topic.fromEntity(TopicEntity entity) {
    return Topic._(
      name: entity.name,
      id: entity.id,
      isEnabled: entity.isEnabled,
    );
  }

  TopicEntity toEntity() {
    return TopicEntity(
      name: name,
      id: id,
      isEnabled: isEnabled,
    );
  }
}

class TopicEntity {
  final String name;
  final String id;
  final bool isEnabled;

  TopicEntity({required this.name, required this.id, required this.isEnabled});

  factory TopicEntity.fromJson(Map<String, dynamic> json) {
    return TopicEntity(
      name: json['name'],
      id: json['_id'],
      isEnabled: json['is_enabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      '_id': id,
      'is_enabled': isEnabled,
    };
  }
}
