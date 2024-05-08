import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
part 'add_poll_option_response_model.g.dart';

class AddPollOptionResponse {
  final WidgetModel? widget;

  AddPollOptionResponse({
    this.widget,
  });

  AddPollOptionResponseEntity toEntity() {
    return AddPollOptionResponseEntity(
      widget: widget?.toEntity(),
    );
  }

  factory AddPollOptionResponse.fromEntity(AddPollOptionResponseEntity entity) {
    return AddPollOptionResponse(
      widget:
          entity.widget != null ? WidgetModel.fromEntity(entity.widget!) : null,
    );
  }
}

@JsonSerializable()
class AddPollOptionResponseEntity {
  final WidgetModelEntity? widget;

  AddPollOptionResponseEntity({
    this.widget,
  });

  factory AddPollOptionResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AddPollOptionResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AddPollOptionResponseEntityToJson(this);
}
