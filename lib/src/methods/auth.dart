// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_feed/src/models/auth/initiate_user_response_model.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';

class AuthApi {
  final String apiKey;

  final AuthRepository authRepository;
  AuthApi({
    required this.apiKey,
    required this.authRepository,
  });

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    print("initiating user");
    return await authRepository.initiateUser(initiateUserRequest);
  }
}
