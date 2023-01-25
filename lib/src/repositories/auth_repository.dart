// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:feed_sdk/src/models/auth/initiate_user_request_model.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_response_model.dart';
import 'package:feed_sdk/src/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;
  AuthRepository({
    required this.authService,
  });

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return await authService.initiateUser(initiateUserRequest);
  }
}
