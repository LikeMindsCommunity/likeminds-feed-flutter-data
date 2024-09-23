import 'package:likeminds_feed/src/models/user/get_blocked_users_request.dart';
import 'package:likeminds_feed/src/models/user/get_blocked_users_response.dart';
import 'package:likeminds_feed/src/models/user/get_user_feed_meta_request.dart';
import 'package:likeminds_feed/src/models/user/get_user_feed_meta_response.dart';
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

  Future<GetBlockedUsersResponse> getBlockedUsers(
      GetBlockedUsersRequest request) async {
    final GetBlockedUsersResponse response =
        await userRepository.getBlockedUsers(request);
    return response;
  }
}
