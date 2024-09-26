import 'package:dio/dio.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/endpoints.dart';

Future<LMResponse<InitiateUserResponse>> testInitiateUser(
    bool prod, InitiateUserRequest request) async {
  final response = await Dio().post(
    EndPoints.instance(prod).authEndpoint,
    data: request.toJson(),
    options: Options(
      headers: {
        'x-api-key': request.apiKey,
      },
    ),
  );

  InitiateUserResponseEntity initiateUserResponse =
      InitiateUserResponseEntity.fromJson(response.data);

  return LMResponse<InitiateUserResponse>(
    success: initiateUserResponse.success,
    errorMessage: initiateUserResponse.errorMessage,
    data: InitiateUserResponse.fromEntity(initiateUserResponse),
  );
}
