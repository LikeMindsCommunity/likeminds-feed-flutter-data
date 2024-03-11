library likeminds_feed;

export 'src/methods/sdk.dart';
export 'src/methods/methods.dart';
export 'src/models/models.dart';
export 'src/persistence/logger/logger.dart';

import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/methods/methods.dart';
import 'package:likeminds_feed/src/methods/sdk.dart';
import 'package:likeminds_feed/src/persistence/logger/logger.dart';
import 'src/models/models.dart';

/// Flutter flavour/environment manager v0.0.1
const _prod = !bool.fromEnvironment('DEBUG');

const String feedSDKVersion = "1.7.1";

class LMFeedClient {
  late final SDKApplication _sdkApplication;

  LMFeedClient._({
    required String apiKey,
    LMSDKCallback? sdkCallback,
    InitiateLoggerRequest? initiateLoggerRequest,
  }) {
    DIService.instance.init(apiKey, _prod, sdkCallback);
    _sdkApplication = SDKApplication.instance;
    // ignore: prefer_initializing_formals
    if (initiateLoggerRequest != null) {
      LMFeedLogger.instance
          .initialise(initiateLoggerRequest: initiateLoggerRequest);
    }
  }

  Future<GetFeedResponse> getUniversalFeed(
      GetFeedRequest universalFeedRequest) async {
    final GetFeedResponse universalFeedResponse = await _sdkApplication
        .getFeedApi()
        .getUniversalFeed(universalFeedRequest);
    return universalFeedResponse;
  }

  Future<PostDetailResponse> getPostDetails(
      PostDetailRequest postDetailRequest) async {
    final PostDetailResponse postDetailResponse =
        await _sdkApplication.getFeedApi().getPost(postDetailRequest);
    return postDetailResponse;
  }

  Future<GetFeedRoomResponse> getFeedRoom(
      GetFeedRoomRequest getFeedRoomRequest) async {
    final GetFeedRoomResponse response =
        await _sdkApplication.getFeedApi().getFeedRoom(getFeedRoomRequest);
    return response;
  }

  Future<GetFeedOfFeedRoomResponse> getFeedOfFeedRoom(
      GetFeedOfFeedRoomRequest getFeedFeedRoomRequest) async {
    final GetFeedOfFeedRoomResponse response = await _sdkApplication
        .getFeedApi()
        .getFeedOfFeedRoom(getFeedFeedRoomRequest);
    return response;
  }

  Future<GetTopicsResponse> getTopics(GetTopicsRequest request) async {
    final GetTopicsResponse response =
        await _sdkApplication.getFeedApi().getTopics(request);
    return response;
  }

  Future<GetUserFeedMetaResponse> getUserFeedMeta(
      GetUserFeedMetaRequest request) async {
    final GetUserFeedMetaResponse response =
        await _sdkApplication.getUserApi().getUserFeedMeta(request);
    return response;
  }

  Future<GetUserPostResponse> getUserCreatedPosts(
      GetUserPostRequest request) async {
    final GetUserPostResponse response =
        await _sdkApplication.getFeedApi().getUserCreatedPosts(request);
    return response;
  }

  Future<GetUserCommentsResponse> getUserCreatedComments(
      GetUserCommentsRequest request) async {
    final GetUserCommentsResponse response =
        await _sdkApplication.getCommentApi().getUserCreatedComments(request);
    return response;
  }

  Future<GetSavedPostResponse> getSavedPost(GetSavedPostRequest request) async {
    final GetSavedPostResponse response =
        await _sdkApplication.getFeedApi().getSavedPost(request);
    return response;
  }

  Future<GetCommunityConfigurationsResponse>
      getCommunityConfigurations() async {
    final GetCommunityConfigurationsResponse response =
        await _sdkApplication.getCommunityApi().getCommunityConfigurations();
    return response;
  }

  Future<InitiateUserResponse> initiateUser(InitiateUserRequest request) async {
    return await _sdkApplication.getAuthApi().initiateUser(request);
  }

  Future<RefreshResponse> refreshUser(RefreshRequest refreshRequest) async {
    return await _sdkApplication.getAuthApi().refreshUser(refreshRequest);
  }

  Future<LogoutResponse> logout(LogoutRequest request) async {
    return await _sdkApplication.getAuthApi().logoutUser(request);
  }

  Future<GetFeedResponse> getFeed(GetFeedRequest request) async {
    return await _sdkApplication.getFeedApi().getUniversalFeed(request);
  }

  Future<AddPostResponse> addPost(AddPostRequest request) async {
    return await _sdkApplication.getPostApi().addPost(request);
  }

  Future<DeletePostResponse> deletePost(DeletePostRequest request) async {
    return await _sdkApplication.getPostApi().deletePost(request);
  }

  Future<GetPostResponse> getPost(GetPostRequest request) async {
    return await _sdkApplication.getPostApi().getPost(request);
  }

  Future<GetPostLikesResponse> getPostLikes(GetPostLikesRequest request) async {
    return await _sdkApplication.getPostApi().getPostLikes(request);
  }

  Future<LikePostResponse> likePost(LikePostRequest likePostRequest) async {
    return await _sdkApplication.getPostApi().likePost(likePostRequest);
  }

  Future<PinPostResponse> pinPost(PinPostRequest pinPostRequest) async {
    return await _sdkApplication.getPostApi().pinPost(pinPostRequest);
  }

  Future<SavePostResponse> savePost(SavePostRequest savePostRequest) async {
    return await _sdkApplication.getPostApi().savePost(savePostRequest);
  }

  Future<EditPostResponse> editPost(EditPostRequest editPostRequest) async {
    return await _sdkApplication.getPostApi().editPost(editPostRequest);
  }

  Future<PostReportResponse> postReport(
      PostReportRequest postReportRequest) async {
    return await _sdkApplication.getPostApi().postReport(postReportRequest);
  }

  Future<SearchPostResponse> searchPosts(
      SearchPostRequest searchPostRequest) async {
    final SearchPostResponse searchPostResponse =
        await _sdkApplication.getPostApi().searchPosts(searchPostRequest);
    return searchPostResponse;
  }

  Future<DeleteCommentResponse> deleteComment(
      DeleteCommentRequest deleteCommentRequest) async {
    return await _sdkApplication
        .getCommentApi()
        .deleteComment(deleteCommentRequest);
  }

  Future<AddCommentResponse> addComment(
      AddCommentRequest addCommentRequest) async {
    return await _sdkApplication.getCommentApi().addComment(addCommentRequest);
  }

  Future<EditCommentResponse> editComment(
      EditCommentRequest editCommentRequest) async {
    return await _sdkApplication
        .getCommentApi()
        .editComment(editCommentRequest);
  }

  Future<GetCommentLikesResponse> getCommentLikes(
      GetCommentLikesRequest request) async {
    return await _sdkApplication.getCommentApi().getCommentLikes(request);
  }

  Future<ToggleLikeCommentResponse> likeComment(
      ToggleLikeCommentRequest likeCommentRequest) async {
    return await _sdkApplication
        .getCommentApi()
        .toggleLikeComment(likeCommentRequest);
  }

  Future<MemberStateResponse> getMemberState() async {
    return await _sdkApplication.getAccessApi().getMemberState();
  }

  Future<GetProfileResponse> getProfile(GetProfileRequest request) async {
    return await _sdkApplication.getAccessApi().getProfile(request);
  }

  Future<EditProfileResponse> editProfile(EditProfileRequest request) async {
    return await _sdkApplication.getAccessApi().editProfile(request);
  }

  Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequest request) async {
    return await LMNotifications.registerDevice(request);
  }

  Future<GetTaggingListResponse> getTaggingList(
      {required GetTaggingListRequest request}) async {
    return await _sdkApplication
        .getHelperApi()
        .getTaggingList(request: request);
  }

  void routeToProfile(String userId) {
    _sdkApplication.getHelperApi().routeProfilePage(userId);
  }

  void routeToCompany(String companyId) {
    _sdkApplication.getHelperApi().routeCompanyPage(companyId);
  }

  Future<DecodeUrlResponse> decodeUrl(DecodeUrlRequest request) async {
    return await _sdkApplication.getHelperApi().decodeUrl(request: request);
  }

  Future<GetDeleteReasonResponse> getReportTags(
      GetDeleteReasonRequest request) async {
    return await _sdkApplication.getModerationApi().getDeleteReasons(request);
  }

  Future<ToggleLikeCommentResponse> toggleLikeComment(
      ToggleLikeCommentRequest request) async {
    final ToggleLikeCommentResponse response =
        await _sdkApplication.getCommentApi().toggleLikeComment(request);
    return response;
  }

  Future<GetCommentResponse> getComment(GetCommentRequest request) async {
    final GetCommentResponse response =
        await _sdkApplication.getCommentApi().getComment(request);
    return response;
  }

  Future<AddCommentReplyResponse> addCommentReply(
      AddCommentReplyRequest request) async {
    final AddCommentReplyResponse response =
        await _sdkApplication.getCommentApi().addCommentReply(request);
    return response;
  }

  Future<EditCommentReplyResponse> editCommentReply(
      EditCommentReplyRequest request) async {
    final EditCommentReplyResponse response =
        await _sdkApplication.getCommentApi().editCommentReply(request);
    return response;
  }

  Future<GetNotificationFeedResponse> getNotificationFeed(
      GetNotificationFeedRequest request) async {
    final GetNotificationFeedResponse response = await _sdkApplication
        .getNotificationFeedApi()
        .getNotificationFeed(request);
    return response;
  }

  Future<MarkReadNotificationResponse> markReadNotification(
      MarkReadNotificationRequest request) async {
    final MarkReadNotificationResponse response = await _sdkApplication
        .getNotificationFeedApi()
        .markReadNotification(request);
    return response;
  }

  Future<GetUnreadNotificationCountResponse>
      getUnreadNotificationCount() async {
    final GetUnreadNotificationCountResponse response = await _sdkApplication
        .getNotificationFeedApi()
        .getUnreadNotificationCount();
    return response;
  }

  Future<GetUserActivityResponse> getUserActivity(
      GetUserActivityRequest request) async {
    final GetUserActivityResponse response =
        await _sdkApplication.getNotificationFeedApi().getUserActivity(request);
    return response;
  }

  Future<GetWidgetResponse> getWidgets(GetWidgetRequest request) async {
    final GetWidgetResponse response =
        await _sdkApplication.getWidgetApi().getWidgets(request);
    return response;
  }

  Future<PushLogResponse> pushLogs(PushLogRequest request) async {
    final PushLogResponse response =
        await _sdkApplication.getLoggerApi().pushLogs(request: request);
    return response;
  }
}

class LMFeedClientBuilder {
  String? _apiKey;
  LMSDKCallback? _sdkCallback;
  InitiateLoggerRequest? _initiateLoggerRequest;

  void apiKey(String apiKey) {
    _apiKey = apiKey;
  }

  void sdkCallback(LMSDKCallback? sdkCallback) {
    _sdkCallback = sdkCallback;
  }

  void initiateLoggerRequest(InitiateLoggerRequest initiateLoggerRequest) {
    _initiateLoggerRequest = initiateLoggerRequest;
  }

  LMFeedClient build() {
    if (_apiKey == null) {
      throw Exception("API Key is not provided");
    }
    debugPrint("SDK Initiation point reached");
    return LMFeedClient._(
      apiKey: _apiKey!,
      sdkCallback: _sdkCallback,
      initiateLoggerRequest: _initiateLoggerRequest,
    );
  }
}
