// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';

class AuthApi {
  final AuthRepository authRepository;

  AuthApi({
    required this.authRepository,
  });

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return await authRepository.initiateUser(initiateUserRequest);
  }

  Future<RefreshResponse> refreshUser(RefreshRequest refreshRequest) async {
    return await authRepository.refreshUser(refreshRequest);
  }

  Future<LogoutResponse> logoutUser(LogoutRequest logoutRequest) async {
    return await authRepository.logoutUser(logoutRequest);
  }
}
