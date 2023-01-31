import 'package:json_annotation/json_annotation.dart';

part 'popup_menu_item_model.g.dart';

class PopupMenuItemModel {
  final String title;
  PopupMenuItemModel({
    required this.title,
  });

  factory PopupMenuItemModel.fromEntity(
      {required PopupMenuItemModelEntity entity}) {
    return PopupMenuItemModel(title: entity.title);
  }

  PopupMenuItemModelEntity toEntity() {
    return PopupMenuItemModelEntity(title: title);
  }
}

@JsonSerializable()
class PopupMenuItemModelEntity {
  final String title;
  PopupMenuItemModelEntity({
    required this.title,
  });

  factory PopupMenuItemModelEntity.fromJson(Map<String, dynamic> data) =>
      _$PopupMenuItemModelEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PopupMenuItemModelEntityToJson(this);
}
