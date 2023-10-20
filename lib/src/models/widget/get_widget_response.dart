import 'package:likeminds_feed/src/models/widget/widget.dart';

class GetWidgetResponse {
  bool success;
  String? errorMessage;
  List<WidgetModel>? widgets;

  GetWidgetResponse({
    this.widgets,
    required this.success,
    this.errorMessage,
  });

  factory GetWidgetResponse.fromJson(Map<String, dynamic> json) {
    return GetWidgetResponse(
      success: json['success'],
      errorMessage: json['error_message'],
      widgets: json['data'] != null &&
              json['data']['widgets'] != null &&
              json['data']['widgets'].isNotEmpty
          ? (json['data']['widgets']
                  ?.map((e) =>
                      WidgetModel.fromEntity(WidgetModelEntity.fromJson(e)))
                  .toList())
              .cast<WidgetModel>()
          : null,
    );
  }
}
