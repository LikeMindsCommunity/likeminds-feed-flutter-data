/// This file contains all the endpoints used in the package

// ignore_for_file: constant_identifier_names

class EndPoints {
  static EndPoints? _instance;
  static EndPoints instance(bool? isProd) =>
      _instance ??= EndPoints._(isProduction: isProd ?? false);

  final bool isProduction;
  final int pageLimit = 10;

  EndPoints._({required this.isProduction});

  String get CARAVAN_HOST => isProduction
      ? "https://likeminds.community/api"
      : "https://beta.likeminds.community/api";
  String get KETTLE_HOST => isProduction
      ? "https://auth.likeminds.community"
      : "https://betaauth.likeminds.community";

  String get authEndpoint => "$KETTLE_HOST/sdk/initiate";
  String get authRefreshEndpoint => "$KETTLE_HOST/user/refresh";
  String get authLogoutEndpoint => "$KETTLE_HOST/user/logout";

  String get registerDeviceEndpoint => "$CARAVAN_HOST/push";

  String get feedUrl => "$KETTLE_HOST/feed";
  String get feedroomEndpoint => "$KETTLE_HOST/feedroom";
  String get feedOfFeedroomEndpoint => "$KETTLE_HOST/feed/group";

  String get addPostEndpoint => "$KETTLE_HOST/feed/post";

  String get accessEndpoint => "$CARAVAN_HOST/community_member/fetch_access";
  String get memberStateEndpoint => "$KETTLE_HOST/community/member/state";

  String getBrandingEndPoint(String communityId) {
    return "$CARAVAN_HOST/community/$communityId/branding";
  }

  String getUniversalFeedEndPoint(int page) {
    return "$feedUrl/universal?page=$page&page_size=$pageLimit";
  }

  String getPostEndPoint(String postId, int page) {
    return "$feedUrl/post/$postId?page=$page&page_size=$pageLimit";
  }

  String getAddCommentEndPoint(String postId) {
    return "$feedUrl/post/$postId/comment";
  }

  String toggleLikeCommentEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId/like";
  }

  String getCommentEndPoint(String commentId, String postId, int page) {
    return "$feedUrl/post/$postId/comment/$commentId?page=$page&page_size=$pageLimit";
  }

  String addCommentReplyEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId/comment";
  }
}
