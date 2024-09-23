import 'package:likeminds_feed/src/models/models.dart';
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

  Future<LMResponse<GetBlockedUsersResponse>> getBlockedUsers(
      GetBlockedUsersRequest request) async {
    final LMResponse<GetBlockedUsersResponseEntity> responseEntity =
        await userService.getBlockedUsers(request);
    return LMResponse.fromData(
        response: responseEntity,
        data: responseEntity.data != null
            ? GetBlockedUsersResponse.fromEntity(responseEntity.data!)
            : null);
  }

  Future<LMResponse<void>> toggleUser(BlockUserRequest request) async {
    final LMResponse<void> response = await userService.toggleUser(request);
    return response;
  }
}
