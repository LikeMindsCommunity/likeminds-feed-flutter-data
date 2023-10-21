import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/widgets_service.dart';

class WidgetRepository {
  final WidgetsService widgetsService;

  WidgetRepository({required this.widgetsService});

  Future<GetWidgetResponse> getWidgets(GetWidgetRequest request) async {
    final GetWidgetResponse response = await widgetsService.getWidgets(request);
    return response;
  }
}
