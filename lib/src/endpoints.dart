// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:likeminds_feed/src/environment/env.dart';

/// The `EndPoints` class provides a singleton instance to manage API endpoints
/// for different environments (production or development). It constructs URLs
/// for various API calls based on the environment.
///
/// Example usage:
/// ```dart
/// var endpoints = EndPoints.instance(true); // For production
/// var authUrl = endpoints.authEndpoint;
/// ```
///
/// The class includes endpoints for authentication, feed, community, user
/// activities, notifications, comments, polls, and more.
class EndPoints {
  /// Singleton instance
  static EndPoints? _instance;

  /// Returns the singleton instance of `EndPoints`.
  /// If the instance is not created, it initializes with the given environment.
  ///
  /// [isProd] - Boolean flag to indicate if the environment is production.
  static EndPoints instance(bool? isProd) =>
      _instance ??= EndPoints._(isProduction: isProd ?? false);

  /// Indicates if the environment is production
  final bool isProduction;

  /// Default page limit for paginated endpoints
  final int pageLimit = 10;

  /// Private constructor
  EndPoints._({required this.isProduction});

  /// Returns the host URL based on the environment.
  String get KETTLE_HOST =>
      isProduction ? EnvProd.kettleHost : EnvDev.kettleHost;

  /// Endpoint for initiating authentication.
  String get authEndpoint => "$KETTLE_HOST/sdk/initiate";

  /// Endpoint for refreshing authentication token.
  String get authRefreshEndpoint => "$KETTLE_HOST/user/refresh";

  /// Endpoint for logging out.
  String get authLogoutEndpoint => "$KETTLE_HOST/user/logout";

  /// Endpoint for fetching community configurations.
  String get communityConfigurationsEndpoint =>
      "$KETTLE_HOST/community/configurations";

  /// Endpoint for fetching member profile.
  String get memberProfileEndpoint => "$KETTLE_HOST/community/member/profile";

  /// Endpoint for registering a device for push notifications.
  String get registerDeviceEndpoint => "$KETTLE_HOST/user/device/push";

  /// Base URL for feed-related endpoints.
  String get feedUrl => "$KETTLE_HOST/feed";

  /// Endpoint for fetching the universal feed.
  String get universalFeed => "$feedUrl/universal";

  /// Endpoint for fetching the personalized feed.
  String get personalisedFeed => "$feedUrl/personalised";

  /// Endpoint for marking a post as seen.
  String get postSeenEndpoint => "$feedUrl/post/seen";

  /// Endpoint for fetching feedroom details.
  String get feedroomEndpoint => "$KETTLE_HOST/feedroom";

  /// Endpoint for fetching feed of a specific feedroom.
  String get feedOfFeedroomEndpoint => "$KETTLE_HOST/feed/group";

  /// Endpoint for exploring feedrooms.
  String get exploreFeedroom => "$KETTLE_HOST/community/feed";

  /// Endpoint for joining or leaving a feedroom.
  String get joinLeaveFeedroom => "$KETTLE_HOST/feedroom/follow";

  /// Endpoint for adding a new post.
  String get addPostEndpoint => "$KETTLE_HOST/feed/post";

  /// Endpoint for fetching tags.
  String get tagsEndpoint => "$KETTLE_HOST/community/tag";

  /// Endpoint for decoding a URL.
  String get decodeUrlEndpoint => "$KETTLE_HOST/helper/url";

  /// Endpoint for reporting a tag.
  String get reportEndpoint => "$KETTLE_HOST/community/report/tag";

  /// Endpoint for reporting a post.
  String get postReportEndpoint => "$KETTLE_HOST/community/report";

  /// Endpoint for fetching member state.
  String get memberStateEndpoint => "$KETTLE_HOST/community/member/state";

  /// Endpoint for fetching notification feed.
  String get getNotificationFeedEndpoint => "$KETTLE_HOST/feed/user/activity";

  /// Endpoint for fetching topic feed.
  String get topicFeedEndpoint => "$KETTLE_HOST/feed/topic";

  /// Endpoint for fetching widgets.
  String get widgetsEndpoint => "$KETTLE_HOST/widget";

  /// Endpoint for logging.
  String get loggerEndpoint => "$KETTLE_HOST/logs";

  /// Endpoint for searching posts.
  String get searchPostEndpoint => "$KETTLE_HOST/search/post";

  /// Endpoint for fetching unread notification count.
  String get getUnreadNotificationCountEndpoint =>
      "$KETTLE_HOST/feed/user/activity/unread_count";

  /// Endpoint for fetching user topics.
  String get getUserTopicsEndpoint => "$KETTLE_HOST/feed/user/topics";

  /// Returns the endpoint for fetching user activity by UUID.
  ///
  /// [uuid] - The UUID of the user.
  String getUserActivityEndpoint(String uuid) =>
      "$KETTLE_HOST/feed/user/$uuid/activity";

  /// Returns the endpoint for marking a notification as
  /// read by notification ID.
  ///
  /// [notificationId] - The ID of the notification.
  String markReadNotificationEndpoint(String notificationId) =>
      "$KETTLE_HOST/feed/user/activity/$notificationId/mark_read";

  /// Returns the endpoint for fetching a post by post ID.
  ///
  /// [postId] - The ID of the post.
  String getPostEndPoint(String postId) {
    return "$feedUrl/post/$postId";
  }

  /// Returns the endpoint for fetching saved posts of a user by UUID.
  ///
  /// [uuid] - The UUID of the user.
  String getUserSavedPostEndPoint(String uuid) {
    return "$feedUrl/user/$uuid/save";
  }

  /// Returns the endpoint for fetching posts created by a user by UUID.
  ///
  /// [uuid] - The UUID of the user.
  String getUserCreatedPosts(String uuid) {
    return "$feedUrl/user/$uuid/post";
  }

  /// Returns the endpoint for fetching feed metadata of a user by UUID.
  ///
  /// [uuid] - The UUID of the user.
  String getUserFeedMetaEndPoint(String uuid) {
    return "$feedUrl/user/$uuid/meta";
  }

  /// Returns the endpoint for fetching comments created by a user by UUID.
  ///
  /// [uuid] - The UUID of the user.
  String getUserCreatedCommentsEndPoint(String uuid) {
    return "$feedUrl/user/$uuid/comment";
  }

  /// Returns the endpoint for adding a comment to a post by post ID.
  ///
  /// [postId] - The ID of the post.
  String getAddCommentEndPoint(String postId) {
    return "$feedUrl/post/$postId/comment";
  }

  /// Returns the endpoint for editing a comment by comment ID and post ID.
  ///
  /// [commentId] - The ID of the comment.
  /// [postId] - The ID of the post.
  String getEditCommentEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId";
  }

  /// Returns the endpoint for toggling like on a comment by
  /// comment ID and post ID.
  ///
  /// [commentId] - The ID of the comment.
  /// [postId] - The ID of the post.
  String toggleLikeCommentEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId/like";
  }

  /// Returns the endpoint for fetching a comment by
  /// comment ID, post ID, and page number.
  ///
  /// [commentId] - The ID of the comment.
  /// [postId] - The ID of the post.
  /// [page] - The page number for pagination.
  String getCommentEndPoint(String commentId, String postId, int page) {
    return "$feedUrl/post/$postId/comment/$commentId?page=$page&page_size=$pageLimit";
  }

  /// Returns the endpoint for deleting a comment by comment ID and post ID.
  ///
  /// [commentId] - The ID of the comment.
  /// [postId] - The ID of the post.
  String deleteCommentEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId";
  }

  /// Returns the endpoint for adding a reply to a comment by
  /// comment ID and post ID.
  ///
  /// [commentId] - The ID of the comment.
  /// [postId] - The ID of the post.
  String addCommentReplyEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId/comment";
  }

  /// Returns the endpoint for editing a reply to a comment by
  /// comment ID, post ID, and reply ID.
  ///
  /// [commentId] - The ID of the comment.
  /// [postId] - The ID of the post.
  /// [replyId] - The ID of the reply.
  String editCommentReplyEndPoint(
      String commentId, String postId, String replyId) {
    return "$feedUrl/post/$postId/comment/$replyId";
  }

  /// Returns the endpoint for updating user topics by UUID.
  ///
  /// [uuid] - The UUID of the user.
  String updateUserTopicsEndpoint(String uuid) {
    return "$KETTLE_HOST/feed/user/$uuid/topics";
  }

  /// Returns the endpoint for submitting a poll vote by poll ID.
  ///
  /// [pollId] - The ID of the poll.
  String getSubmitPollVoteEndPoint(String pollId) {
    return "$KETTLE_HOST/poll/$pollId/vote";
  }

  /// Returns the endpoint for adding a poll option by poll ID.
  ///
  /// [pollId] - The ID of the poll.
  String getAddPollOptionEndPoint(String pollId) {
    return "$KETTLE_HOST/poll/$pollId";
  }

  /// Returns the endpoint for fetching poll votes by poll ID.
  ///
  /// [pollId] - The ID of the poll.
  String getPollVotesEndPoint(String pollId) {
    return "$KETTLE_HOST/poll/$pollId/vote";
  }

  /// Returns the endpoint for fetching pending posts of a user by UUID.
  ///
  /// [uuid] - The UUID of the user.
  String getPendingPostsEndpoint(String uuid) {
    return "$feedUrl/user/$uuid/post/pending";
  }

  /// Returns the endpoint for fetching a pending post by post ID.
  ///
  /// [postId] - The ID of the post.
  String getPendingPostEndpoint(String postId) {
    return "$feedUrl/post/pending/$postId";
  }

  /// Returns the endpoint for fetching connection metadata of a user by UUID.
  ///
  /// [uuid] - The UUID of the user.
  String getConnectionMetaEndpoint(String uuid) {
    return "$KETTLE_HOST/community/member/$uuid/connection_meta";
  }

  /// Returns the endpoint for fetching connections of a user by UUID.
  ///
  /// [uuid] - The UUID of the user.
  String getConnectionEndpoint(String uuid) {
    return "$KETTLE_HOST/community/member/$uuid/connection";
  }

  /// Returns the endpoint for blocking a user by user ID.
  ///
  /// [userId] - The ID of the user.
  String blockUserEndpoint(String userId) {
    return "$KETTLE_HOST/user/$userId/block";
  }
}
