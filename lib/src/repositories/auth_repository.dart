// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return InitiateUserResponse.fromEntity(
      await authService.initiateUser(initiateUserRequest),
    );
  }

  Future<ValidateUserResponse> validateUser(
      ValidateUserRequest validateUserRequest) async {
    return ValidateUserResponse.fromEntity(
      await authService.validateUser(validateUserRequest),
    );
  }

  Future<RefreshAccessTokenResponse> refreshUser(
      RefreshAccessTokenRequest refreshRequest) async {
    return RefreshAccessTokenResponse.fromEntity(
      entity: await authService.refreshAccessToken(refreshRequest),
    );
  }

  Future<LMResponse> logoutUser(LogoutRequest logoutRequest) async {
    return await authService.logout(logoutRequest);
  }
}
