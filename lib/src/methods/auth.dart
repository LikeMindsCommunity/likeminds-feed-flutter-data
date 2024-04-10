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

  /// Validate a user
  /// Validates a user
  /// Returns [ValidateUserResponse]
  /// Takes [ValidateUserRequest] as input
  Future<ValidateUserResponse> validateUser(
      ValidateUserRequest validateUserRequest) async {
    return await authRepository.validateUser(validateUserRequest);
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
