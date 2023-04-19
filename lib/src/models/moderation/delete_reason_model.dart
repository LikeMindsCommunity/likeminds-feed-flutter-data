import 'package:json_annotation/json_annotation.dart';

part 'delete_reason_model.g.dart';

class DeleteReason {
  final int id;
  final String name;

  DeleteReason({required this.id, required this.name});

  factory DeleteReason.fromEntity(DeleteReasonEntity entity) {
    return DeleteReason(
      id: entity.id,
      name: entity.name,
    );
  }

  toEntity() {
    return DeleteReasonEntity(
      id: id,
      name: name,
    );
  }
}

@JsonSerializable()
class DeleteReasonEntity {
  final int id;
  final String name;

  DeleteReasonEntity({required this.id, required this.name});

  factory DeleteReasonEntity.fromJson(Map<String, dynamic> json) =>
      _$DeleteReasonEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteReasonEntityToJson(this);
}
