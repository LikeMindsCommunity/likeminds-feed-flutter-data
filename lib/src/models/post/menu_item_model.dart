import 'package:json_annotation/json_annotation.dart';

part 'menu_item_model.g.dart';

class MenuItem {
  final String title;
  MenuItem({
    required this.title,
  });

  factory MenuItem.fromEntity({required MenuItemEntity entity}) {
    return MenuItem(title: entity.title);
  }
}

@JsonSerializable()
class MenuItemEntity {
  final String title;
  MenuItemEntity({
    required this.title,
  });

  factory MenuItemEntity.fromJson(Map<String, dynamic> data) =>
      _$MenuItemEntityFromJson(data);

  Map<String, dynamic> toJson() => _$MenuItemEntityToJson(this);
}
