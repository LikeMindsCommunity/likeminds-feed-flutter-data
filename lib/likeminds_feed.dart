library likeminds_feed;

export 'src/methods/sdk.dart';
export 'src/methods/methods.dart';
export 'src/models/models.dart';

import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/methods/methods.dart';
import 'package:likeminds_feed/src/methods/sdk.dart';
import 'src/models/models.dart';

/// Flutter flavour/environment manager v0.0.1
const _prod = !bool.fromEnvironment('DEBUG');

class LMFeedClient {
  late final SDKApplication _sdkApplication;

  LMFeedClient._({
    required String apiKey,
    required LMSDKCallback sdkCallback,
  }) {
    DIService.instance.init(apiKey, _prod, sdkCallback);
    _sdkApplication = SDKApplication();
  }

  FeedApi getFeedApi() {
    return _sdkApplication.getFeedApi();
  }

  CommentApi getCommentApi() {
    return _sdkApplication.getCommentApi();
  }

  Future<InitiateUserResponse> initiateUser(InitiateUserRequest request) async {
    return await _sdkApplication.getAuthApi().initiateUser(request);
  }

  Future<UniversalFeedResponse?> getUniversalFeed(
      UniversalFeedRequest request) async {
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

  Future<EditPostResponse> editPost(EditPostRequest editPostRequest) async {
    return await _sdkApplication.getPostApi().editPost(editPostRequest);
  }

  Future<DeleteCommentResponse> deleteComment(
      DeleteCommentRequest deleteCommentRequest) async {
    return await _sdkApplication
        .getCommentApi()
        .deleteComment(deleteCommentRequest);
  }

  Future<AddCommentResponse?> addComment(
      AddCommentRequest addCommentRequest) async {
    return await _sdkApplication.getCommentApi().addComment(addCommentRequest);
  }

  Future<EditCommentResponse?> editComment(
      EditCommentRequest editCommentRequest) async {
    return await _sdkApplication
        .getCommentApi()
        .editComment(editCommentRequest);
  }

  Future<GetCommentLikesResponse> getCommentLikes(
      GetCommentLikesRequest request) async {
    return await _sdkApplication.getCommentApi().getCommentLikes(request);
  }

  Future<ToggleLikeCommentResponse?> likeComment(
      ToggleLikeCommentRequest likeCommentRequest) async {
    return await _sdkApplication
        .getCommentApi()
        .toggleLikeComment(likeCommentRequest);
  }

  Future<GetFeedOfFeedRoomResponse> getFeedOfFeedRoom(
      GetFeedOfFeedRoomRequest request) async {
    return await _sdkApplication.getFeedApi().getFeedOfFeedRoom(request);
  }

  Future<GetFeedRoomResponse> getFeedRoom(GetFeedRoomRequest request) async {
    return await _sdkApplication.getFeedApi().getFeedRoom(request);
  }

  Future<MemberStateResponse> getMemberState() async {
    return await _sdkApplication.getAccessApi().getMemberState();
  }

  Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequest request) async {
    return await LMNotifications.registerDevice(request);
  }

  Future<TagResponseModel> getTags({required TagRequestModel request}) async {
    return await _sdkApplication.getHelperApi().getTags(request: request);
  }

  void routeToProfile(String userId) {
    _sdkApplication.getHelperApi().routeProfilePage(userId);
  }

  Future<DecodeUrlResponse> decodeUrl(DecodeUrlRequest request) async {
    return await _sdkApplication.getHelperApi().decodeUrl(request: request);
  }

  Future<GetDeleteReasonResponse> getReportTags(
      GetDeleteReasonRequest request) async {
    return await _sdkApplication.getModerationApi().getDeleteReasons(request);
  }
}

class LMFeedClientBuilder {
  String? _apiKey;
  LMSDKCallback? _sdkCallback;

  void apiKey(String apiKey) {
    _apiKey = apiKey;
  }

  void sdkCallback(LMSDKCallback sdkCallback) {
    _sdkCallback = sdkCallback;
  }

  LMFeedClient build() {
    if (_apiKey == null) {
      throw Exception("API Key is not provided");
    }
    if (_sdkCallback == null) {
      throw Exception("SDK Callback is not provided");
    }
    debugPrint("SDK Initiation point reached");
    return LMFeedClient._(
      apiKey: _apiKey!,
      sdkCallback: _sdkCallback!,
    );
  }
}
