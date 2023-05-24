import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class CommentService {
  final ApiClient apiClient;
  CommentService({required this.apiClient});

  Future<AddCommentResponseEntity> addComment(
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
      debugPrint(response.data.toString());
      return AddCommentResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return AddCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    } catch (e) {
      debugPrint(e.toString());
      return AddCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    }
  }

  Future<EditCommentResponseEntity> editComment(
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
      debugPrint(response.data.toString());
      return EditCommentResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return EditCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    } catch (e) {
      debugPrint(e.toString());
      return EditCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    }
  }

  Future<ToggleLikeCommentResponseEntity> toggleLikeComment(
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
      debugPrint(response.data.toString());
      return ToggleLikeCommentResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return ToggleLikeCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    } catch (e) {
      debugPrint(e.toString());
      return ToggleLikeCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    }
  }

  Future<GetCommentResponseEntity> getComment(GetCommentRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getCommentEndPoint(
                request.commentId, request.postId, request.page),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      debugPrint(response.data.toString());
      return GetCommentResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return GetCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    } catch (e) {
      debugPrint(e.toString());
      return GetCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
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
      debugPrint(response.data.toString());
      return DeleteCommentResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return DeleteCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    } catch (e) {
      debugPrint(e.toString());
      return DeleteCommentResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    }
  }

  Future<AddCommentReplyResponseEntity> addCommentReply(
      AddCommentReplyRequest request) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints
                .addCommentReplyEndPoint(request.commentId, request.postId),
            data: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      debugPrint(response.data.toString());
      return AddCommentReplyResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return AddCommentReplyResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    } catch (e) {
      debugPrint(e.toString());
      return AddCommentReplyResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    }
  }

  Future<EditCommentReplyResponseEntity> editCommentReply(
      EditCommentReplyRequest request) async {
    try {
      final response = await apiClient.client().put(
            apiClient.getEndpoints.editCommentReplyEndPoint(
                request.commentId, request.postId, request.replyId),
            data: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      debugPrint(response.data.toString());
      return EditCommentReplyResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return EditCommentReplyResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
    } catch (e) {
      debugPrint(e.toString());
      return EditCommentReplyResponseEntity(
          success: false,
          errorMessage: 'An error occurred, please try again later');
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
      debugPrint(response.data.toString());
      return GetCommentLikesResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
      return GetCommentLikesResponseEntity(
        success: false,
        errorMessage: 'An error occurred, please try again later',
      );
    } catch (e) {
      debugPrint(e.toString());
      return GetCommentLikesResponseEntity(
        success: false,
        errorMessage: 'An error occurred, please try again later',
      );
    }
  }
}
