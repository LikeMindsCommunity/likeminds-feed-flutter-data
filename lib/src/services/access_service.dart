import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/src/models/access/edit_profile_request.dart';
import 'package:likeminds_feed/src/models/access/edit_profile_response.dart';
import 'package:likeminds_feed/src/models/access/get_profile_request.dart';
import 'package:likeminds_feed/src/models/access/get_profile_response.dart';
import 'package:likeminds_feed/src/models/auth/member_state_response_model.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class AccessService {
  final ApiClient apiClient;

  AccessService({required this.apiClient});

  /// Get the state of the member for feedroom access
  /// Returns the state of the member
  Future<MemberStateResponseEntity> getMemberState() async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.memberStateEndpoint,
            options: Options(
              headers: {
                'x-api-key': apiClient.getApiKey,
              },
            ),
          );

      final memberStateResponseEntity =
          MemberStateResponseEntity.fromJson(response.data);

      return memberStateResponseEntity;
    } on DioError catch (e) {
      debugPrint("Error from get member state access: $e");
      return MemberStateResponseEntity(
          success: false, errorMessage: e.toString());
    }
  }


  // Get the profile of a User in the community
  // Returns the profile of the user
  Future<GetProfileResponseEntity> getProfile(
      GetProfileRequest request) async {
    try {
      final response = await apiClient.client().get(
        apiClient.getEndpoints.communityProfileEndpoint,
        queryParameters: request.toJson(),
      );

      final communityProfile =
      GetProfileResponseEntity.fromJson(response.data);

      return communityProfile;
    } on DioException catch (e) {
      // Handle Dio errors
      debugPrint("Dio error: $e");
      return GetProfileResponseEntity(
          success: false, errorMessage: e.response?.statusMessage);
    } catch (err) {
      debugPrint("Error from get community profile: ${err.toString()}");
      return GetProfileResponseEntity(
          success: false, errorMessage: err.toString());
    }
  }


  // Edits the profile of a User in the community
  // Returns a boolean success
  Future<EditProfileResponseEntity> editProfile(
      EditProfileRequest request) async {
    try {
      final response = await apiClient.client().get(
        apiClient.getEndpoints.communityProfileEndpoint,
        queryParameters: request.toJson(),
      );

      final communityProfile =
      EditProfileResponseEntity.fromJson(response.data);

      return communityProfile;
    } on DioException catch (e) {
      // Handle Dio errors
      debugPrint("Dio error: $e");
      return EditProfileResponseEntity(
          success: false, errorMessage: e.response?.statusMessage);
    } catch (err) {
      debugPrint("Error from get community profile: ${err.toString()}");
      return EditProfileResponseEntity(
          success: false, errorMessage: err.toString());
    }
  }
}
