import 'package:likeminds_feed/src/models/user/get_blocked_users_request.dart';
import 'package:likeminds_feed/src/models/user/get_blocked_users_response.dart';
import 'package:likeminds_feed/src/models/user/get_user_feed_meta_request.dart';
import 'package:likeminds_feed/src/models/user/get_user_feed_meta_response.dart';
import 'package:likeminds_feed/src/services/user_service.dart';

class UserRepository {
  final UserService userService;
  UserRepository({required this.userService});
  Future<GetUserFeedMetaResponse> getUserFeedMeta(
      GetUserFeedMetaRequest request) async {
    final GetUserFeedMetaResponseEntity responseEntity =
        await userService.getUserFeedMeta(request);
    return GetUserFeedMetaResponse.fromEntity(responseEntity);
  }

  Future<GetBlockedUsersResponse> getBlockedUsers(
      GetBlockedUsersRequest request) async {
    final GetBlockedUsersResponseEntity responseEntity =
        await userService.getBlockedUsers(request);
    return GetBlockedUsersResponse.fromEntity(responseEntity);
  }
}
