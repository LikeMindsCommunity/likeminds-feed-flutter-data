import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/user_repository.dart';

class UserApi {
  final UserRepository userRepository;

  UserApi({required this.userRepository});

  Future<GetUserFeedMetaResponse> getUserFeedMeta(
      GetUserFeedMetaRequest request) async {
    final GetUserFeedMetaResponse response =
        await userRepository.getUserFeedMeta(request);
    return response;
  }

  Future<LMResponse<GetBlockedUsersResponse>> getBlockedUsers(
      GetBlockedUsersRequest request) async {
    final LMResponse<GetBlockedUsersResponse> response =
        await userRepository.getBlockedUsers(request);
    return response;
  }

  Future<LMResponse<void>> toggleUser(BlockUserRequest request) async {
    final LMResponse<void> response = await userRepository.toggleUser(request);
    return response;
  }
}
