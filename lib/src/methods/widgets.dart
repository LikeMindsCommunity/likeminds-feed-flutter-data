import 'package:likeminds_feed/src/models/models.dart';

import 'package:likeminds_feed/src/repositories/widget_repository.dart';

class WidgetApi {
  final WidgetRepository widgetRepository;

  WidgetApi({required this.widgetRepository});

  Future<GetWidgetResponse> getWidgets(GetWidgetRequest request) async {
    final GetWidgetResponse response =
        await widgetRepository.getWidgets(request);
    return response;
  }
}
