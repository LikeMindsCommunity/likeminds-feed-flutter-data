// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:likeminds_feed/src/environment/env.dart';

class EndPoints {
  static EndPoints? _instance;
  static EndPoints instance(bool? isProd) =>
      _instance ??= EndPoints._(isProduction: isProd ?? false);

  final bool isProduction;
  final int pageLimit = 10;

  EndPoints._({required this.isProduction});

  String get KETTLE_HOST =>
      isProduction ? EnvProd.kettleHost : EnvDev.kettleHost;

  String get authEndpoint => "$KETTLE_HOST/sdk/initiate";
  String get authRefreshEndpoint => "$KETTLE_HOST/user/refresh";
  String get authLogoutEndpoint => "$KETTLE_HOST/user/logout";

  String get registerDeviceEndpoint => "$KETTLE_HOST/user/device/push";

  String get feedUrl => "$KETTLE_HOST/feed";
  String get universalFeed => "$feedUrl/universal";
  String get feedroomEndpoint => "$KETTLE_HOST/feedroom";
  String get feedOfFeedroomEndpoint => "$KETTLE_HOST/feed/group";

  String get addPostEndpoint => "$KETTLE_HOST/feed/post";

  String get tagsEndpoint => "$KETTLE_HOST/community/tag";

  String get decodeUrlEndpoint => "$KETTLE_HOST/helper/url";
  String get reportEndpoint => "$KETTLE_HOST/community/report/tag";

  String get memberStateEndpoint => "$KETTLE_HOST/community/member/state";

  String get getNotificationFeedEndpoint => "$KETTLE_HOST/feed/user/activity";

  String get topicFeedEndpoint => "$KETTLE_HOST/feed/topic";

  String get getUnreadNotificationCountEndpoint =>
      "$KETTLE_HOST/feed/user/activity/unread_count";

  String markReadNotificationEndpoint(String notificationId) =>
      "$KETTLE_HOST/feed/user/activity/$notificationId/mark_read";

  String getPostEndPoint(String postId, int page) {
    return "$feedUrl/post/$postId?page=$page&page_size=$pageLimit";
  }

  String getAddCommentEndPoint(String postId) {
    return "$feedUrl/post/$postId/comment";
  }

  String getEditCommentEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId";
  }

  String toggleLikeCommentEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId/like";
  }

  String getCommentEndPoint(String commentId, String postId, int page) {
    return "$feedUrl/post/$postId/comment/$commentId?page=$page&page_size=$pageLimit";
  }

  String deleteCommentEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId";
  }

  String addCommentReplyEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId/comment";
  }

  String editCommentReplyEndPoint(
      String commentId, String postId, String replyId) {
    return "$feedUrl/post/$postId/comment/$replyId";
  }
}
