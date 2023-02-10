// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_feed/src/models/auth/initiate_user_response_model.dart';
import 'package:likeminds_feed/src/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;
  AuthRepository({
    required this.authService,
  });

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return await authService.initiateUser(initiateUserRequest);
  }

  Future<RefreshResponse> refreshUser(RefreshRequest refreshRequest) async {
    return RefreshResponse.fromEntity(
      entity: await authService.refresh(refreshRequest),
    );
  }

  Future<LogoutResponse> logoutUser(LogoutRequest logoutRequest) async {
    return LogoutResponse.fromEntity(
      await authService.logout(logoutRequest),
    );
  }
}
