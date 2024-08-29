library likeminds_feed;

export 'src/methods/sdk.dart';
export 'src/methods/methods.dart';
export 'src/models/models.dart';
export 'src/persistence/persistence.dart';

import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/methods/methods.dart';
import 'package:likeminds_feed/src/methods/sdk.dart';
import 'package:likeminds_feed/src/persistence/persistence.dart';
import 'src/models/models.dart';

/// Flutter flavour/environment manager v0.0.1
const _prod = !bool.fromEnvironment('DEBUG');

const String feedSDKVersion = "1.14.0";

class LMFeedClient {
  late final SDKApplication _sdkApplication;

  // Private constructor
  // User Builder class to get an instance of LMFeedClient
  LMFeedClient._({
    LMSDKCallback? sdkCallback,
    InitiateLoggerRequest? initiateLoggerRequest,
  }) {
    DIService.instance.init(_prod, sdkCallback);
    _sdkApplication = SDKApplication.instance;
    // ignore: prefer_initializing_formals
  }

  Future<LMResponse<void>> init(
      {InitiateLoggerRequest? initiateLoggerRequest}) async {
    return await LMFeedPersistence.instance.init();
  }

  // ------------------------------------------
  // Initiation APIs
  // Use these to login user, and fetch essential permissions

  /// initiateUser is used to initiate a user session
  /// [InitiateUserRequest] is used to pass the required parameters
  /// [InitiateUserResponse] is returned as a Future
  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return await _sdkApplication.getAuthApi().initiateUser(initiateUserRequest);
  }

  /// validateUser is used to validate a user session
  /// [ValidateUserRequest] is used to pass the required parameters
  /// [ValidateUserResponse] is returned as a Future
  Future<ValidateUserResponse> validateUser(
      ValidateUserRequest validateUserRequest) async {
    return await _sdkApplication.getAuthApi().validateUser(validateUserRequest);
  }

  /// refreshUser is used to refresh a user session
  /// [RefreshAccessTokenRequest] is used to pass the required parameters
  /// [RefreshAccessTokenResponse] is returned as a Future
  Future<RefreshAccessTokenResponse> refreshUser(
      RefreshAccessTokenRequest refreshRequest) async {
    return await _sdkApplication.getAuthApi().refreshUser(refreshRequest);
  }

  /// logout is used to logout a user session
  /// [LogoutRequest] is used to pass the required parameters
  /// [LogoutResponse] is returned as a Future
  Future<LogoutResponse> logout(LogoutRequest request) async {
    return await _sdkApplication.getAuthApi().logoutUser(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Feed APIs
  // Use these to fetch feed, and feed groups

  /// getUniversalFeed is used to fetch the universal feed
  /// [GetFeedRequest] is used to pass the required parameters
  /// [GetFeedResponse] is returned as a Future
  Future<GetFeedResponse> getUniversalFeed(
      GetFeedRequest universalFeedRequest) async {
    final GetFeedResponse universalFeedResponse = await _sdkApplication
        .getFeedApi()
        .getUniversalFeed(universalFeedRequest);
    return universalFeedResponse;
  }

  /// getPersonalisedFeed is used to fetch the personalised feed
  /// [GetPersonalisedFeedRequest] is used to pass the required parameters
  /// [GetPersonalisedFeedResponse] is returned as a Future
  Future<LMResponse<GetPersonalisedFeedResponse>> getPersonalisedFeed(
      GetPersonalisedFeedRequest personalisedFeedRequest) async {
    final LMResponse<GetPersonalisedFeedResponse> response =
        await _sdkApplication
            .getFeedApi()
            .getPersonalisedFeed(personalisedFeedRequest);
    return response;
  }

  /// postSeen is used to mark a post as seen
  /// [PostSeenRequest] is used to pass the required parameters
  /// [LMResponse<void>] is returned as a Future
  Future<LMResponse<void>> postSeen(PostSeenRequest request) async {
    final LMResponse<void> response =
        await _sdkApplication.getFeedApi().postSeen(request);
    return response;
  }

  /// getFeedRoom is used to fetch the feed room list
  /// [GetFeedRoomRequest] is used to pass the required parameters
  /// [GetFeedRoomResponse] is returned as a Future
  Future<GetFeedRoomResponse> getFeedRoom(
      GetFeedRoomRequest getFeedRoomRequest) async {
    final GetFeedRoomResponse response =
        await _sdkApplication.getFeedApi().getFeedRoom(getFeedRoomRequest);
    return response;
  }

  /// getFeedOfFeedRoom is used to fetch the feed of a feed room
  /// [GetFeedOfFeedRoomRequest] is used to pass the required parameters
  /// [GetFeedOfFeedRoomResponse] is returned as a Future
  Future<GetFeedOfFeedRoomResponse> getFeedOfFeedRoom(
      GetFeedOfFeedRoomRequest getFeedFeedRoomRequest) async {
    final GetFeedOfFeedRoomResponse response = await _sdkApplication
        .getFeedApi()
        .getFeedOfFeedRoom(getFeedFeedRoomRequest);
    return response;
  }

  /// getExploreFeedRooms is used to fetch the explore feed rooms
  /// [GetExploreFeedRoomRequest] is used to pass the required parameters
  /// [LMResponse<GetExploreFeedRoomResponse>] is returned as a Future
  Future<LMResponse<GetExploreFeedRoomResponse>> getExploreFeedRooms(
      GetExploreFeedRoomRequest request) async {
    final LMResponse<GetExploreFeedRoomResponse> response =
        await _sdkApplication.getFeedApi().getExploreFeedRooms(request);
    return response;
  }

  /// joinFeedRoom is used to follow or unfollow a feed room
  /// [JoinFeedRoomRequest] is used to pass the required parameters
  /// [LMResponse<void>] is returned as a Future
  Future<LMResponse<void>> joinFeedRoom(JoinFeedRoomRequest request) async {
    final LMResponse<void> response =
        await _sdkApplication.getFeedApi().joinFeedRoom(request);
    return response;
  }

  /// getTopics is used to fetch the topics
  /// [GetTopicsRequest] is used to pass the required parameters
  /// [GetTopicsResponse] is returned as a Future
  Future<GetTopicsResponse> getTopics(GetTopicsRequest request) async {
    final GetTopicsResponse response =
        await _sdkApplication.getFeedApi().getTopics(request);
    return response;
  }

  /// getUserFeedMeta is used to fetch the user feed meta
  /// [GetUserFeedMetaRequest] is used to pass the required parameters
  /// [GetUserFeedMetaResponse] is returned as a Future
  Future<GetUserFeedMetaResponse> getUserFeedMeta(
      GetUserFeedMetaRequest request) async {
    final GetUserFeedMetaResponse response =
        await _sdkApplication.getUserApi().getUserFeedMeta(request);
    return response;
  }

  /// getUserCreatedPosts is used to fetch the user created posts
  /// [GetUserPostRequest] is used to pass the required parameters
  /// [GetUserPostResponse] is returned as a Future
  Future<GetUserPostResponse> getUserCreatedPosts(
      GetUserPostRequest request) async {
    final GetUserPostResponse response =
        await _sdkApplication.getFeedApi().getUserCreatedPosts(request);
    return response;
  }

  /// getUserCreatedComments is used to fetch the user created comments
  /// [GetUserCommentsRequest] is used to pass the required parameters
  /// [GetUserCommentsResponse] is returned as a Future
  Future<GetUserCommentsResponse> getUserCreatedComments(
      GetUserCommentsRequest request) async {
    final GetUserCommentsResponse response =
        await _sdkApplication.getCommentApi().getUserCreatedComments(request);
    return response;
  }

  /// getSavedPost is used to fetch the saved posts
  /// [GetSavedPostRequest] is used to pass the required parameters
  /// [GetSavedPostResponse] is returned as a Future
  Future<GetSavedPostResponse> getSavedPost(GetSavedPostRequest request) async {
    final GetSavedPostResponse response =
        await _sdkApplication.getFeedApi().getSavedPost(request);
    return response;
  }

  /// getPostDetails is used to fetch the details of a post
  /// [PostDetailRequest] is used to pass the required parameters
  /// [PostDetailResponse] is returned as a Future
  Future<PostDetailResponse> getPostDetails(
      PostDetailRequest postDetailRequest) async {
    final PostDetailResponse postDetailResponse =
        await _sdkApplication.getFeedApi().getPost(postDetailRequest);
    return postDetailResponse;
  }

  /// updateUserTopics is used to update the user topics
  /// [UpdateUserTopicsRequest] is used to pass the required parameters
  /// [UpdateUserTopicsResponse] is returned as a Future
  Future<UpdateUserTopicsResponse> updateUserTopics(
      UpdateUserTopicsRequest request) async {
    final UpdateUserTopicsResponse response =
        await _sdkApplication.getFeedApi().updateUserTopics(request);
    return response;
  }

  /// getUserTopics is used to fetch the user topics
  /// [GetUserTopicsRequest] is used to pass the required parameters
  /// [GetUserTopicsResponse] is returned as a Future
  Future<GetUserTopicsResponse> getUserTopics(
      GetUserTopicsRequest request) async {
    final GetUserTopicsResponse response =
        await _sdkApplication.getFeedApi().getUserTopics(request);
    return response;
  }

  // ------------------------------------------

  // ------------------------------------------
  // Community APIs
  // Use these to fetch community configurations

  /// getCommunityConfigurations is used to fetch the community configurations
  /// [GetCommunityConfigurationsResponse] is returned as a Future
  Future<GetCommunityConfigurationsResponse>
      getCommunityConfigurations() async {
    final GetCommunityConfigurationsResponse response =
        await _sdkApplication.getCommunityApi().getCommunityConfigurations();
    return response;
  }
  // ------------------------------------------

  // ------------------------------------------
  // Post APIs
  // Use these to fetch, add, delete, edit posts, and more

  /// getPost is used to fetch a post
  /// [GetPostRequest] is used to pass the required parameters
  /// [GetPostResponse] is returned as a Future
  Future<GetPostResponse> getPost(GetPostRequest request) async {
    return await _sdkApplication.getPostApi().getPost(request);
  }

  /// getPendingPost is used to fetch a pending post
  /// [GetPendingPostRequest] is used to pass the required parameters
  /// [GetPendingPostResponse] is returned as a Future
  /// [LMResponse<GetPendingPostResponse>] is returned as a Future
  Future<LMResponse<GetPendingPostResponse>> getPendingPost(
      GetPendingPostRequest request) async {
    return await _sdkApplication.getPostApi().getPendingPost(request);
  }

  // getAllPendingPost is used to fetch all pending posts
  // [GetAllPendingPostRequest] is used to pass the required parameters
  // [GetAllPendingPostResponse] is returned as a Future
  Future<LMResponse<GetAllPendingPostsResponse>> getAllPendingPosts(
      GetAllPendingPostsRequest request) async {
    return await _sdkApplication.getPostApi().getAllPendingPosts(request);
  }

  /// addPost is used to add a post
  /// [AddPostRequest] is used to pass the required parameters
  /// [AddPostResponse] is returned as a Future
  Future<AddPostResponse> addPost(AddPostRequest request) async {
    return await _sdkApplication.getPostApi().addPost(request);
  }

  /// deletePost is used to delete a post
  /// [DeletePostRequest] is used to pass the required parameters
  /// [DeletePostResponse] is returned as a Future
  Future<DeletePostResponse> deletePost(DeletePostRequest request) async {
    return await _sdkApplication.getPostApi().deletePost(request);
  }

  /// deletePendingPost is used to delete a post
  /// [DeletePendingPostRequest] is used to pass the required parameters
  /// [LMResponse] is returned as a Future
  Future<LMResponse<void>> deletePendingPost(
      DeletePendingPostRequest request) async {
    return await _sdkApplication.getPostApi().deletePendingPost(request);
  }

  /// getPostLikes is used to fetch the likes of a post
  /// [GetPostLikesRequest] is used to pass the required parameters
  /// [GetPostLikesResponse] is returned as a Future
  Future<GetPostLikesResponse> getPostLikes(GetPostLikesRequest request) async {
    return await _sdkApplication.getPostApi().getPostLikes(request);
  }

  /// likePost is used to like a post
  /// [LikePostRequest] is used to pass the required parameters
  /// [LikePostResponse] is returned as a Future
  Future<LikePostResponse> likePost(LikePostRequest likePostRequest) async {
    return await _sdkApplication.getPostApi().likePost(likePostRequest);
  }

  /// pinPost is used to pin a post
  /// [PinPostRequest] is used to pass the required parameters
  /// [PinPostResponse] is returned as a Future
  Future<PinPostResponse> pinPost(PinPostRequest pinPostRequest) async {
    return await _sdkApplication.getPostApi().pinPost(pinPostRequest);
  }

  /// savePost is used to save a post
  /// [SavePostRequest] is used to pass the required parameters
  /// [SavePostResponse] is returned as a Future
  Future<SavePostResponse> savePost(SavePostRequest savePostRequest) async {
    return await _sdkApplication.getPostApi().savePost(savePostRequest);
  }

  /// editPost is used to edit a post
  /// [EditPendingPostRequest] is used to pass the required parameters
  /// [EditPostResponse] is returned as a Future
  Future<EditPostResponse> editPost(EditPostRequest editPostRequest) async {
    return await _sdkApplication.getPostApi().editPost(editPostRequest);
  }

  /// editPendingPost is used to edit a pending post
  /// [EditPendingPostRequest] is used to pass the required parameters
  /// [EditPendingPostResponse] is returned as a Future
  Future<LMResponse<EditPendingPostResponse>> editPendingPost(
      EditPendingPostRequest editPendingPostRequest) async {
    return await _sdkApplication
        .getPostApi()
        .editPendingPost(editPendingPostRequest);
  }

  /// postReport is used to report a post
  /// [PostReportRequest] is used to pass the required parameters
  /// [PostReportResponse] is returned as a Future
  Future<PostReportResponse> postReport(
      PostReportRequest postReportRequest) async {
    return await _sdkApplication.getPostApi().postReport(postReportRequest);
  }

  /// searchPosts is used to search posts
  /// [SearchPostRequest] is used to pass the required parameters
  /// [SearchPostResponse] is returned as a Future
  Future<SearchPostResponse> searchPosts(
      SearchPostRequest searchPostRequest) async {
    final SearchPostResponse searchPostResponse =
        await _sdkApplication.getPostApi().searchPosts(searchPostRequest);
    return searchPostResponse;
  }

  /// submitPollVote is used to submit a poll vote
  /// [SubmitPollVoteRequest] is used to pass the required parameters
  /// [LMResponse<void>] is returned as a Future
  Future<LMResponse<void>> submitPollVote(
      SubmitPollVoteRequest submitPollVoteRequest) async {
    return await _sdkApplication
        .getPostApi()
        .submitPollVote(submitPollVoteRequest);
  }

  /// addPollOption is used to add a poll option
  /// [AddPollOptionRequest] is used to pass the required parameters
  /// [LMResponse<AddPollOptionResponse>] is returned as a Future
  Future<LMResponse<AddPollOptionResponse>> addPollOption(
      AddPollOptionRequest addPollOptionRequest) async {
    return await _sdkApplication
        .getPostApi()
        .addPollOption(addPollOptionRequest);
  }

  /// getPollVotes is used to fetch the votes of a poll
  /// [GetPollVotesRequest] is used to pass the required parameters
  /// [LMResponse<GetVotesResponse>] is returned as a Future
  Future<LMResponse<GetPollVotesResponse>> getPollVotes(
      GetPollVotesRequest getVotesRequest) async {
    return await _sdkApplication.getPostApi().getPollVotes(getVotesRequest);
  }

  // ------------------------------------------
  // Comment APIs
  // Use these to fetch, add, delete, edit comments, and more

  /// addComment is used to add a comment
  /// [AddCommentRequest] is used to pass the required parameters
  /// [AddCommentResponse] is returned as a Future
  Future<AddCommentResponse> addComment(
      AddCommentRequest addCommentRequest) async {
    return await _sdkApplication.getCommentApi().addComment(addCommentRequest);
  }

  /// editComment is used to edit a comment
  /// [EditCommentRequest] is used to pass the required parameters
  /// [EditCommentResponse] is returned as a Future
  Future<EditCommentResponse> editComment(
      EditCommentRequest editCommentRequest) async {
    return await _sdkApplication
        .getCommentApi()
        .editComment(editCommentRequest);
  }

  /// deleteComment is used to delete a comment
  /// [DeleteCommentRequest] is used to pass the required parameters
  /// [DeleteCommentResponse] is returned as a Future
  Future<DeleteCommentResponse> deleteComment(
      DeleteCommentRequest deleteCommentRequest) async {
    return await _sdkApplication
        .getCommentApi()
        .deleteComment(deleteCommentRequest);
  }

  /// likeComment is used to like a comment
  /// [ToggleLikeCommentRequest] is used to pass the required parameters
  /// [ToggleLikeCommentResponse] is returned as a Future
  Future<ToggleLikeCommentResponse> likeComment(
      ToggleLikeCommentRequest likeCommentRequest) async {
    return await _sdkApplication
        .getCommentApi()
        .toggleLikeComment(likeCommentRequest);
  }

  /// toggleLikeComment is used to like a comment
  /// [ToggleLikeCommentRequest] is used to pass the required parameters
  /// [ToggleLikeCommentResponse] is returned as a Future
  Future<ToggleLikeCommentResponse> toggleLikeComment(
      ToggleLikeCommentRequest request) async {
    final ToggleLikeCommentResponse response =
        await _sdkApplication.getCommentApi().toggleLikeComment(request);
    return response;
  }

  /// getCommentLikes is used to fetch the likes of a comment
  /// [GetCommentLikesRequest] is used to pass the required parameters
  /// [GetCommentLikesResponse] is returned as a Future
  Future<GetCommentLikesResponse> getCommentLikes(
      GetCommentLikesRequest request) async {
    return await _sdkApplication.getCommentApi().getCommentLikes(request);
  }

  /// getComment is used to fetch a comment, and its replies
  /// [GetCommentRequest] is used to pass the required parameters
  /// [GetCommentResponse] is returned as a Future
  Future<GetCommentResponse> getComment(GetCommentRequest request) async {
    final GetCommentResponse response =
        await _sdkApplication.getCommentApi().getComment(request);
    return response;
  }

  /// addCommentReply is used to add a reply to a comment
  /// [AddCommentReplyRequest] is used to pass the required parameters
  /// [AddCommentReplyResponse] is returned as a Future
  Future<AddCommentReplyResponse> addCommentReply(
      AddCommentReplyRequest request) async {
    final AddCommentReplyResponse response =
        await _sdkApplication.getCommentApi().addCommentReply(request);
    return response;
  }

  /// editCommentReply is used to delete a reply to a comment
  /// [EditCommentReplyRequest] is used to pass the required parameters
  /// [EditCommentReplyResponse] is returned as a Future
  Future<EditCommentReplyResponse> editCommentReply(
      EditCommentReplyRequest request) async {
    final EditCommentReplyResponse response =
        await _sdkApplication.getCommentApi().editCommentReply(request);
    return response;
  }
  // ------------------------------------------

  // ------------------------------------------
  // Access APIs
  // Use these to fetch user profile, and member state

  /// getMemberState is used to fetch the member state
  /// [MemberStateResponse] is returned as a Future
  Future<MemberStateResponse> getMemberState() async {
    return await _sdkApplication.getAccessApi().getMemberState();
  }

  /// getProfile is used to fetch the user profile
  /// [GetProfileRequest] is used to pass the required parameters
  /// [GetProfileResponse] is returned as a Future
  Future<GetProfileResponse> getProfile(GetProfileRequest request) async {
    return await _sdkApplication.getAccessApi().getProfile(request);
  }

  /// editProfile is used to edit the user profile
  /// [EditProfileRequest] is used to pass the required parameters
  /// [EditProfileResponse] is returned as a Future
  Future<EditProfileResponse> editProfile(EditProfileRequest request) async {
    return await _sdkApplication.getAccessApi().editProfile(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Notification API
  // Use these to register device for receiving notifications

  /// registerDevice is used to register a device for receiving notifications
  /// [RegisterDeviceRequest] is used to pass the required parameters
  /// [RegisterDeviceResponse] is returned as a Future
  Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequest request) async {
    return await LMNotifications.registerDevice(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Helper API
  // Use these to fetch tagging list, and decode URLs

  /// getTaggingList is used to fetch the tagging list
  /// [GetTaggingListRequest] is used to pass the required parameters
  /// [GetTaggingListResponse] is returned as a Future
  Future<GetTaggingListResponse> getTaggingList(
      {required GetTaggingListRequest request}) async {
    return await _sdkApplication
        .getHelperApi()
        .getTaggingList(request: request);
  }

  /// decodeUrl is used to decode a URL
  /// [DecodeUrlRequest] is used to pass the required parameters
  /// [DecodeUrlResponse] is returned as a Future
  Future<DecodeUrlResponse> decodeUrl(DecodeUrlRequest request) async {
    return await _sdkApplication.getHelperApi().decodeUrl(request: request);
  }

  /// routeToProfile is used to route to a user profile
  /// [String] userId is used to pass the required parameters
  void routeToProfile(String userId) {
    _sdkApplication.getHelperApi().routeProfilePage(userId);
  }

  /// routeToCompany is used to route to a company profile
  /// [String] companyId is used to pass the required parameters
  void routeToCompany(String companyId) {
    _sdkApplication.getHelperApi().routeCompanyPage(companyId);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Moderation API
  // Use these to fetch report tags, and delete reasons

  /// getReportTags is used to fetch the report tags
  /// [GetReportTagsRequest] is used to pass the required parameters
  /// [GetReportTagsResponse] is returned as a Future
  Future<GetDeleteReasonResponse> getReportTags(
      GetDeleteReasonRequest request) async {
    return await _sdkApplication.getModerationApi().getDeleteReasons(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Activity APIs
  // Use these to fetch user, notification activity

  /// getNotificationFeed is used to fetch the user activity
  /// [GetNotificationFeedRequest] is used to pass the required parameters
  /// [GetNotificationFeedResponse] is returned as a Future
  Future<GetNotificationFeedResponse> getNotificationFeed(
      GetNotificationFeedRequest request) async {
    final GetNotificationFeedResponse response = await _sdkApplication
        .getNotificationFeedApi()
        .getNotificationFeed(request);
    return response;
  }

  /// markReadNotification is used to mark a notification as read
  /// [MarkReadNotificationRequest] is used to pass the required parameters
  /// [MarkReadNotificationResponse] is returned as a Future
  Future<MarkReadNotificationResponse> markReadNotification(
      MarkReadNotificationRequest request) async {
    final MarkReadNotificationResponse response = await _sdkApplication
        .getNotificationFeedApi()
        .markReadNotification(request);
    return response;
  }

  /// getUnreadNotificationCount is used to fetch the unread notification count
  /// [GetUnreadNotificationCountResponse] is returned as a Future
  Future<GetUnreadNotificationCountResponse>
      getUnreadNotificationCount() async {
    final GetUnreadNotificationCountResponse response = await _sdkApplication
        .getNotificationFeedApi()
        .getUnreadNotificationCount();
    return response;
  }

  /// getUserActivity is used to fetch the user activity
  /// [GetUserActivityRequest] is used to pass the required parameters
  /// [GetUserActivityResponse] is returned as a Future
  Future<GetUserActivityResponse> getUserActivity(
      GetUserActivityRequest request) async {
    final GetUserActivityResponse response =
        await _sdkApplication.getNotificationFeedApi().getUserActivity(request);
    return response;
  }
  // ------------------------------------------

  // ------------------------------------------
  // Widget API
  // Use these to fetch widgets

  /// getWidgets is used to fetch the widgets
  /// [GetWidgetRequest] is used to pass the required parameters
  /// [GetWidgetResponse] is returned as a Future
  Future<GetWidgetResponse> getWidgets(GetWidgetRequest request) async {
    final GetWidgetResponse response =
        await _sdkApplication.getWidgetApi().getWidgets(request);
    return response;
  }
  // ------------------------------------------

  // ------------------------------------------
  // Logger API
  // Use these to push logs

  /// pushLogs is used to push logs
  /// [PushLogRequest] is used to pass the required parameters
  /// [PushLogResponse] is returned as a Future
  Future<LMResponse> pushLogs(PushLogRequest request) async {
    final LMResponse response =
        await _sdkApplication.getLoggerApi().pushLogs(request: request);
    return response;
  }
  // ------------------------------------------

  // ------------------------------------------
  // Persistence Functions
  // These are used to talk to our persistence layer
  // for implementing caching and local DB

  Future<LMResponse<void>> insertOrUpdateLoggedInUser(User user) async {
    return _sdkApplication.getPersistenceApi().insertOrUpdateUser(user);
  }

  LMResponse<User> getLoggedInUser() {
    return _sdkApplication.getPersistenceApi().getUserDB();
  }

  Future<LMResponse<void>> deleteLoggedInUser() async {
    return _sdkApplication.getPersistenceApi().deleteUserDB();
  }

  Future<LMResponse<void>> insertOrUpdateCache(LMCache cache) async {
    return _sdkApplication
        .getPersistenceApi()
        .insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) async {
    return _sdkApplication.getPersistenceApi().deleteCache(key);
  }

  LMResponse<LMCache> getCache(String key) {
    return _sdkApplication.getPersistenceApi().getCache(key);
  }

  Future<LMResponse<void>> clearCache() async {
    return _sdkApplication.getPersistenceApi().clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfigurationsDB(
      List<CommunityConfigurations> communityConfigurations) async {
    return await _sdkApplication
        .getPersistenceApi()
        .insertOrUpdateCommunityConfigurationDB(communityConfigurations);
  }

  LMResponse<CommunityConfigurations> getCommunityConfigurationsDB(
      String type) {
    return _sdkApplication
        .getPersistenceApi()
        .getCommunityConfigurationDB(type);
  }

  Future<LMResponse<void>> deleteCommunityConfigurationsDB(String type) async {
    return _sdkApplication
        .getPersistenceApi()
        .deleteCommunityConfigurationDB(type);
  }

  Future<LMResponse<void>> clearCommunityConfigurationsDB() async {
    return _sdkApplication.getPersistenceApi().clearCommunityConfigurationDB();
  }

  Future<LMResponse<void>> insertOrUpdateLoggedInMemberState(
      MemberStateResponse memberStateResponse) async {
    return await _sdkApplication
        .getPersistenceApi()
        .insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getLoggedInMemberState() {
    return _sdkApplication.getPersistenceApi().getMemberState();
  }

  Future<LMResponse<void>> deleteLoggedInMemberState() async {
    return await _sdkApplication.getPersistenceApi().deleteMemberState();
  }
  // ---------------------------------------
}

class LMFeedClientBuilder {
  LMSDKCallback? _sdkCallback;
  InitiateLoggerRequest? _initiateLoggerRequest;

  void sdkCallback(LMSDKCallback? sdkCallback) {
    _sdkCallback = sdkCallback;
  }

  void initiateLoggerRequest(InitiateLoggerRequest initiateLoggerRequest) {
    _initiateLoggerRequest = initiateLoggerRequest;
  }

  LMFeedClient build() {
    return LMFeedClient._(
      sdkCallback: _sdkCallback,
      initiateLoggerRequest: _initiateLoggerRequest,
    );
  }
}
