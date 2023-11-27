import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/models/widget/get_widget_request.dart';
import 'package:likeminds_feed/src/models/widget/get_widget_response.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

abstract class IWidgetsService {
  Future<GetWidgetResponse> getWidgets(GetWidgetRequest request);
}

class WidgetsService extends IWidgetsService {
  final ApiClient apiClient;

  WidgetsService({
    required this.apiClient,
  });

  @override
  Future<GetWidgetResponse> getWidgets(GetWidgetRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.widgetsEndpoint,
            queryParameters: request.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      GetWidgetResponse getWidgetResponse =
          GetWidgetResponse.fromJson(response.data);
      return getWidgetResponse;
    } on DioError catch (e) {
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetWidgetResponse(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
