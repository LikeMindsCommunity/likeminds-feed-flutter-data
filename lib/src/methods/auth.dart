// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';

/// AuthApi
/// Public API class used to call the auth methods
class AuthApi {
  final AuthRepository authRepository;

  AuthApi({
    required this.authRepository,
  });

  /// Initiate a user
  /// Initiates a user, and logs in
  /// Returns [InitiateUserResponse]
  /// Takes [InitiateUserRequest] as input
  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return await authRepository.initiateUser(initiateUserRequest);
  }

  /// Refresh a user
  /// Refreshes a user, and logs in
  /// Returns [RefreshResponse]
  /// Takes [RefreshRequest] as input
  Future<RefreshResponse> refreshUser(RefreshRequest refreshRequest) async {
    return await authRepository.refreshUser(refreshRequest);
  }

  /// Logout a user
  /// Logs out a user
  /// Returns [LogoutResponse]
  /// Takes [LogoutRequest] as input
  Future<LogoutResponse> logoutUser(LogoutRequest logoutRequest) async {
    return await authRepository.logoutUser(logoutRequest);
  }
}
