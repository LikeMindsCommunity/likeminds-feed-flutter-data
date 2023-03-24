import 'package:dio/dio.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_feed/src/models/auth/initiate_user_response_model.dart';
import 'package:likeminds_feed/src/models/comment/add_comment_reply_request.dart';
import 'package:likeminds_feed/src/models/comment/add_comment_reply_response.dart';
import 'package:likeminds_feed/src/models/feed/comment_detail_request.dart';
import 'package:likeminds_feed/src/models/feed/comment_detail_response.dart';
import 'package:likeminds_feed/src/models/feed/toggle_like_comment_response.dart';
import 'package:likeminds_feed/src/models/feed/post_detail_request.dart';
import 'package:likeminds_feed/src/models/feed/post_detail_response.dart';
import 'package:likeminds_feed/src/models/feed/toggle_like_comment_request.dart';
import 'package:likeminds_feed/src/models/feed/universal_feed_request.dart';
import 'package:likeminds_feed/src/models/feed/universal_feed_response.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class CommentService {
  final ApiClient apiClient;
  CommentService({required this.apiClient});

  Future<PostDetailResponseEntity?> getPost(
      PostDetailRequest postDetailRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getPostEndPoint(
                postDetailRequest.postId, postDetailRequest.page),
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
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints
                .getUniversalFeedEndPoint(universalFeedRequest.page),
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
            apiClient.getEndpoints
                .getAddCommentEndPoint(addCommentRequest.postId),
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
            apiClient.getEndpoints.toggleLikeCommentEndPoint(
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
            apiClient.getEndpoints.getCommentEndPoint(
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

  Future<DeleteCommentResponseEntity> deleteComment(
      DeleteCommentRequest request) async {
    try {
      final response = await apiClient.client().delete(
            apiClient.getEndpoints.deleteCommentEndPoint(
              request.commentId,
              request.postId,
            ),
            data: {'delete_reason': request.reason},
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return DeleteCommentResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      return DeleteCommentResponseEntity(
          success: false, errorMessage: e.message);
    } catch (e) {
      print(e);
      return DeleteCommentResponseEntity(
          success: false, errorMessage: e.toString());
    }
  }

  Future<AddCommentReplyResponseEntity?> addCommentReply(
      AddCommentReplyRequest? request) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints
                .addCommentReplyEndPoint(request!.commentId, request.postId),
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

  Future<GetCommentLikesResponseEntity> getCommentLikes(
      GetCommentLikesRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.toggleLikeCommentEndPoint(
              request.commentId,
              request.postId,
            ),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return GetCommentLikesResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      return GetCommentLikesResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    } catch (e) {
      print(e);
      return GetCommentLikesResponseEntity(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
