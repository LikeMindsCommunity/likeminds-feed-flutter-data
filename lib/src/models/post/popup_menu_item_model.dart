import 'package:json_annotation/json_annotation.dart';

part 'popup_menu_item_model.g.dart';

class PopupMenuItemModel {
  final String title;
  final int id;

  PopupMenuItemModel({
    required this.title,
    required this.id,
  });

  factory PopupMenuItemModel.fromEntity({
    required PopupMenuItemModelEntity entity,
  }) {
    return PopupMenuItemModel(
      title: entity.title,
      id: entity.id,
    );
  }

  PopupMenuItemModelEntity toEntity() {
    return PopupMenuItemModelEntity(
      title: title,
      id: id,
    );
  }
}

@JsonSerializable()
class PopupMenuItemModelEntity {
  final String title;
  final int id;

  PopupMenuItemModelEntity({
    required this.title,
    required this.id,
  });

  factory PopupMenuItemModelEntity.fromJson(Map<String, dynamic> data) =>
      _$PopupMenuItemModelEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PopupMenuItemModelEntityToJson(this);
}
