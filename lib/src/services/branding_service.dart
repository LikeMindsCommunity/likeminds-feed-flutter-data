import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class BrandingService {
  final ApiClient apiClient;

  BrandingService({required this.apiClient});

  Future<BrandingResponseEntity> getBranding(BrandingRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getBrandingEndPoint(request.communityId),
            options: Options(
              headers: {
                'x-member-id': request.userId ?? apiClient.getUserId,
              },
            ),
          );
      BrandingResponseEntity brandingResponse =
          BrandingResponseEntity.fromJson(response.data);
      return brandingResponse;
    } on DioError catch (e) {
      BrandingResponseEntity brandingResponse =
          BrandingResponseEntity.fromJson(e.response?.data);
      return brandingResponse;
    }
  }
}
