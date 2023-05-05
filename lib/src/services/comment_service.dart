import 'package:dio/dio.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
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

  Future<EditCommentResponseEntity?> editComment(
      EditCommentRequest editCommentRequest) async {
    try {
      final response = await apiClient.client().put(
            apiClient.getEndpoints.getEditCommentEndPoint(
                editCommentRequest.commentId, editCommentRequest.postId),
            data: editCommentRequest.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return EditCommentResponseEntity.fromJson(response.data);
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

  Future<EditCommentReplyResponseEntity?> editCommentReply(
      EditCommentReplyRequest? request) async {
    try {
      final response = await apiClient.client().put(
            apiClient.getEndpoints.editCommentReplyEndPoint(
                request!.commentId, request.postId, request.replyId),
            data: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      print(response.data);
      return EditCommentReplyResponseEntity.fromJson(response.data);
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
            queryParameters: {
              'page': request.page,
              'page_size': request.pageSize,
            },
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
