import 'package:dio/dio.dart';
import 'package:feed_sdk/feed_sdk.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_request_model.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_response_model.dart';
import 'package:feed_sdk/src/models/comment/add_comment_reply_request.dart';
import 'package:feed_sdk/src/models/comment/add_comment_reply_response.dart';
import 'package:feed_sdk/src/models/feed/comment_detail_request.dart';
import 'package:feed_sdk/src/models/feed/comment_detail_response.dart';
import 'package:feed_sdk/src/models/feed/toggle_like_comment_response.dart';
import 'package:feed_sdk/src/models/feed/post_detail_request.dart';
import 'package:feed_sdk/src/models/feed/post_detail_response.dart';
import 'package:feed_sdk/src/models/feed/toggle_like_comment_request.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_request.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_response.dart';
import 'package:feed_sdk/src/services/api/api_client.dart';

class CommentService {
  final ApiClient apiClient;
  CommentService({required this.apiClient}) {}
  // final Dio _dio = apiClient.client();
  // final String authHost = "https://betaauth.likeminds.community/feed/";
  Future<PostDetailResponseEntity?> getPost(
      PostDetailRequest postDetailRequest) async {
    // print(apiClient.getUniversalFeedEndPoint(universalFeedRequest.page));
    try {
      final response = await apiClient.client().get(
            apiClient.getPostEndPoint(
                postDetailRequest.postId, postDetailRequest.page),
            // data: universalFeedRequest.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return PostDetailResponseEntity.fromJson(response.data['data']);
    } on DioError catch (e) {
      print(e.toString() + "dsa");
    } catch (e) {
      print(e);
    }
  }

  Future<UniversalFeedResponseEntity?> getUniversalFeed(
      UniversalFeedRequest universalFeedRequest) async {
    print(apiClient.getUniversalFeedEndPoint(universalFeedRequest.page));
    try {
      final response = await apiClient.client().get(
            apiClient.getUniversalFeedEndPoint(universalFeedRequest.page),
            // data: universalFeedRequest.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return UniversalFeedResponseEntity.fromJson(response.data['data']);
    } on DioError catch (e) {
      print(e.toString() + "dsa");
    } catch (e) {
      print(e);
    }
  }

  Future<AddCommentResponseEntity?> addComment(
      AddCommentRequest addCommentRequest) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getAddCommentEndPoint(addCommentRequest.postId),
            data: addCommentRequest.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return AddCommentResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<ToggleLikeCommentResponseEntity?> toggleLikeComment(
      ToggleLikeCommentRequest toggleLikeCommentRequest) async {
    try {
      final response = await apiClient.client().put(
            apiClient.toggleLikeCommentEndPoint(
                toggleLikeCommentRequest.commentId,
                toggleLikeCommentRequest.postId),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return ToggleLikeCommentResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<CommentDetailResponseEntity?> getComment(
      CommentDetailRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getCommentEndPoint(
                request.commentId, request.postId, request.page),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return CommentDetailResponseEntity.fromJson(response.data['data']);
    } on DioError catch (e) {
      print(e.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<AddCommentReplyResponseEntity?> addCommentReply(
      AddCommentReplyRequest? request) async {
    try {
      final response = await apiClient.client().post(
            apiClient.addCommentReplyEndPoint(
                request!.commentId, request.postId),
            data: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return AddCommentReplyResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
    } catch (e) {
      print(e);
    }
  }
}
