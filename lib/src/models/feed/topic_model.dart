class Topic {
  final String name;
  final String id;
  final bool isEnabled;
  final double? priority;
  final String? parentId;
  final String? parentName;
  final int? level;
  final bool? isSearchable;
  final String? widgetId;
  final int? numberOfPosts;
  final int? totalChildCount;

  Topic._({
    required this.name,
    required this.id,
    required this.isEnabled,
    this.priority,
    this.parentId,
    this.parentName,
    this.level,
    this.isSearchable,
    this.widgetId,
    this.numberOfPosts,
    this.totalChildCount,
  });

  factory Topic.fromEntity(TopicEntity entity) {
    return Topic._(
      name: entity.name,
      id: entity.id,
      isEnabled: entity.isEnabled,
      isSearchable: entity.isSearchable,
      level: entity.level,
      parentId: entity.parentId,
      parentName: entity.parentName,
      priority: entity.priority,
      widgetId: entity.widgetId,
      numberOfPosts: entity.numberOfPosts,
      totalChildCount: entity.totalChildCount,
    );
  }

  TopicEntity toEntity() {
    return TopicEntity(
      name: name,
      id: id,
      isEnabled: isEnabled,
      isSearchable: isSearchable,
      level: level,
      parentId: parentId,
      parentName: parentName,
      priority: priority,
      widgetId: widgetId,
      numberOfPosts: numberOfPosts,
      totalChildCount: totalChildCount,
    );
  }
}

class TopicEntity {
  final String name;
  final String id;
  final bool isEnabled;
  final double? priority;
  final String? parentId;
  final String? parentName;
  final int? level;
  final bool? isSearchable;
  final String? widgetId;
  final int? numberOfPosts;
  final int? totalChildCount;

  TopicEntity({
    required this.name,
    required this.id,
    required this.isEnabled,
    this.isSearchable,
    this.level,
    this.parentId,
    this.parentName,
    this.priority,
    this.widgetId,
    this.numberOfPosts,
    this.totalChildCount,
  });

  factory TopicEntity.fromJson(Map<String, dynamic> json) {
    return TopicEntity(
      name: json['name'],
      id: json['_id'],
      isEnabled: json['is_enabled'],
      isSearchable: json['is_searchable'],
      level: json['level'],
      parentId: json['parent_id'],
      parentName: json['parent_name'],
      priority: json['priority'] != null
          ? double.parse(json['priority'].toString())
          : null,
      widgetId: json['widget_id'],
      numberOfPosts: json['number_of_posts'],
      totalChildCount: json['total_child_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      '_id': id,
      'is_enabled': isEnabled,
      'is_searchable': isSearchable,
      'level': level,
      'parent_id': parentId,
      'parent_name': parentName,
      'priority': priority,
      'widget_id': widgetId,
      'number_of_posts': numberOfPosts,
      'total_child_count': totalChildCount,
    };
  }
}
