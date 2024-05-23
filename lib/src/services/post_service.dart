import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

abstract class IPostService {
  Future<AddPostResponseEntity> addPost(AddPostRequest addPostRequest);

  Future<GetPostResponseEntity> getPost(GetPostRequest getPostRequest);

  Future<LMResponse<GetAllPendingPostsResponseEntity>> getAllPendingPosts(
      GetAllPendingPostsRequest getAllPendingPostsRequest);

  Future<GetPostLikesResponseEntity> getPostLikes(
      GetPostLikesRequest getPostLikesRequest);

  Future<DeletePostResponseEntity> deletePost(
      DeletePostRequest deletePostRequest);

  Future<LikePostResponseEntity> likePost(LikePostRequest likePostRequest);

  Future<PinPostResponseEntity> pinPost(PinPostRequest pinPostRequest);

  Future<SavePostResponseEntity> savePost(SavePostRequest savePostRequest);

  Future<EditPostResponseEntity> editPost(EditPostRequest editPostRequest);

  Future<LMResponse<EditPendingPostResponseEntity>> editPendingPost(
      EditPendingPostRequest editPendingPostRequest);

  Future<PostReportResponseEntity> postReport(
      PostReportRequest postReportRequest);

  Future<SearchPostResponseEntity> searchPosts(
      SearchPostRequest searchPostRequest);
  Future<LMResponse<void>> submitPollVote(
      SubmitPollVoteRequest submitPollVoteRequest);

  Future<LMResponse<AddPollOptionResponseEntity>> addPollOption(
      AddPollOptionRequest addPollOptionRequest);
  Future<LMResponse<GetPollVotesResponseEntity>?> getPollVotes(
      GetPollVotesRequest getVotesRequest);
}

class PostService extends IPostService {
  final ApiClient apiClient;

  PostService({
    required this.apiClient,
  });

  @override
  Future<AddPostResponseEntity> addPost(AddPostRequest addPostRequest) async {
    try {
      debugPrint("Access granted");
      final response = await apiClient.client().post(
            apiClient.getEndpoints.addPostEndpoint,
            data: addPostRequest.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      debugPrint("Response from add post: ${response.data}");
      AddPostResponseEntity addPostResponseEntity =
          AddPostResponseEntity.fromJson(response.data);
      return addPostResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return AddPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<GetPostResponseEntity> getPost(GetPostRequest getPostRequest) async {
    try {
      final response = await apiClient.client().get(
        "${apiClient.getEndpoints.addPostEndpoint}/${getPostRequest.postId}",
        queryParameters: {
          'page': getPostRequest.page,
          'page_size': getPostRequest.pageSize,
        },
      );
      debugPrint("Response from get post: ${response.data}");
      GetPostResponseEntity getPostResponseEntity =
          GetPostResponseEntity.fromJson(response.data);
      return getPostResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  Future<LMResponse<GetPendingPostResponseEntity>> getPendingPost(
      GetPendingPostRequest getPendingPostRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.endPoints
                .getPendingPostEndpoint(getPendingPostRequest.postId),
          );

      if (response.data['success'] == true) {
        return LMResponse(
          success: true,
          data: response.data['data'] == null
              ? null
              : GetPendingPostResponseEntity.fromJson(response.data['data']),
        );
      } else {
        return LMResponse(
          success: false,
          errorMessage: response.data['error_message'],
        );
      }
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<LMResponse<GetAllPendingPostsResponseEntity>> getAllPendingPosts(
      GetAllPendingPostsRequest getAllPendingPostsRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.endPoints
                .getPendingPostsEndpoint(getAllPendingPostsRequest.uuid),
            queryParameters: getAllPendingPostsRequest.toJson(),
          );

      LMResponse<GetAllPendingPostsResponseEntity>
          getAllPendingPostsResponseEntity =
          LMResponse<GetAllPendingPostsResponseEntity>.fromJson(response.data,
              GetAllPendingPostsResponseEntity.fromJson(response.data['data']));

      return getAllPendingPostsResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<DeletePostResponseEntity> deletePost(
      DeletePostRequest deletePostRequest) async {
    try {
      final response = await apiClient.client().delete(
            "${apiClient.getEndpoints.addPostEndpoint}/${deletePostRequest.postId}",
            data: deletePostRequest.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      debugPrint("Response from delete post: ${response.data}");
      DeletePostResponseEntity deletePostResponseEntity =
          DeletePostResponseEntity.fromJson(response.data);
      return deletePostResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return DeletePostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  Future<LMResponse<void>> deletePendingPost(
      DeletePendingPostRequest deletePendingPostRequest) async {
    try {
      final response = await apiClient.client().delete(
            apiClient.endPoints
                .getPendingPostEndpoint(deletePendingPostRequest.postId),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );

      if (response.data['success'] == true) {
        return LMResponse(
          success: true,
        );
      } else {
        return LMResponse(
          success: false,
          errorMessage: response.data['error_message'],
        );
      }
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<LikePostResponseEntity> likePost(
      LikePostRequest likePostRequest) async {
    try {
      final response = await apiClient.client().put(
            "${apiClient.getEndpoints.addPostEndpoint}/${likePostRequest.postId}/like",
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      debugPrint("Response from like post: ${response.data}");
      final postResponse = await getPost(
        (GetPostRequestBuilder()
              ..postId(likePostRequest.postId)
              ..page(1)
              ..pageSize(10))
            .build(),
      );
      LikePostResponseEntity likePostResponseEntity =
          LikePostResponseEntity.fromJson(response.data);
      likePostResponseEntity.setLikes = postResponse.post!.likeCount;
      return likePostResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LikePostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<GetPostLikesResponseEntity> getPostLikes(
      GetPostLikesRequest getPostLikesRequest) async {
    try {
      final response = await apiClient.client().get(
            "${apiClient.getEndpoints.addPostEndpoint}/${getPostLikesRequest.postId}/like",
            queryParameters: {
              'page': getPostLikesRequest.page,
              'page_size': getPostLikesRequest.pageSize,
            },
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      debugPrint("Response from get likes on post: ${response.data}");
      GetPostLikesResponseEntity getPostLikesResponseEntity =
          GetPostLikesResponseEntity.fromJson(response.data);
      return getPostLikesResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetPostLikesResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<PinPostResponseEntity> pinPost(PinPostRequest pinPostRequest) async {
    try {
      final response = await apiClient.client().put(
            "${apiClient.getEndpoints.addPostEndpoint}/${pinPostRequest.postId}/pin",
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      PinPostResponseEntity pinPostResponseEntity =
          PinPostResponseEntity.fromJson(response.data);
      return pinPostResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return PinPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<SavePostResponseEntity> savePost(
      SavePostRequest savePostRequest) async {
    try {
      final response = await apiClient.client().put(
            "${apiClient.getEndpoints.addPostEndpoint}/${savePostRequest.postId}/save",
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      SavePostResponseEntity savePostResponseEntity =
          SavePostResponseEntity.fromJson(response.data);
      return savePostResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return SavePostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<EditPostResponseEntity> editPost(
      EditPostRequest editPostRequest) async {
    try {
      final response = await apiClient.client().put(
            "${apiClient.getEndpoints.addPostEndpoint}/${editPostRequest.postId}",
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
            data: editPostRequest.toJson(),
          );
      EditPostResponseEntity editPostResponseEntity =
          EditPostResponseEntity.fromJson(response.data);
      return editPostResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return EditPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<LMResponse<EditPendingPostResponseEntity>> editPendingPost(
      EditPendingPostRequest editPendingPostRequest) async {
    try {
      final response = await apiClient.client().put(
            apiClient.endPoints
                .getPendingPostEndpoint(editPendingPostRequest.postId),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
            data: editPendingPostRequest.toJson(),
          );

      if (response.data['success'] == true) {
        return LMResponse(
          success: true,
          data: response.data['data'] == null
              ? null
              : EditPendingPostResponseEntity.fromJson(response.data['data']),
        );
      } else {
        return LMResponse(
          success: false,
          errorMessage: response.data['error_message'],
        );
      }
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<PostReportResponseEntity> postReport(
      PostReportRequest postReportRequest) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints.postReportEndpoint,
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
            data: postReportRequest.toJson(),
          );
      PostReportResponseEntity postReportResponseEntity =
          PostReportResponseEntity.fromJson(response.data);
      return postReportResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return PostReportResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<SearchPostResponseEntity> searchPosts(
      SearchPostRequest searchPostRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.searchPostEndpoint,
            queryParameters: searchPostRequest.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      debugPrint("Response from search post: ${response.data}");
      SearchPostResponseEntity searchPostResponseEntity =
          SearchPostResponseEntity.fromJson(response.data);
      return searchPostResponseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return SearchPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<LMResponse<void>> submitPollVote(
      SubmitPollVoteRequest submitPollVoteRequest) async {
    try {
      final response = await apiClient.client().put(
            apiClient.endPoints
                .getSubmitPollVoteEndPoint(submitPollVoteRequest.pollId),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
            data: submitPollVoteRequest.toJson(),
          );
      debugPrint("Response from submit poll vote: ${response.data}");
      return LMResponse<void>(
        success: response.data['success'] ?? false,
        errorMessage: response.data['error_message'],
      );
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      return LMResponse<void>(
        success: false,
        errorMessage: e.message ?? "An error occurred",
      );
    }
  }

  @override
  Future<LMResponse<AddPollOptionResponseEntity>> addPollOption(
      AddPollOptionRequest addPollOptionRequest) async {
    try {
      final response = await apiClient.client().put(
            apiClient.endPoints
                .getAddPollOptionEndPoint(addPollOptionRequest.pollId),
            data: addPollOptionRequest.toJson(),
          );
      debugPrint("Response from add poll option: ${response.data}");
      return LMResponse<AddPollOptionResponseEntity>(
        success: response.data['success'] ?? false,
        errorMessage: response.data['error_message'],
        data: AddPollOptionResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      return LMResponse<AddPollOptionResponseEntity>(
        success: false,
        errorMessage: e.message ?? "An error occurred",
      );
    }
  }

  @override
  Future<LMResponse<GetPollVotesResponseEntity>> getPollVotes(
      GetPollVotesRequest getVotesRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.endPoints.getPollVotesEndPoint(getVotesRequest.pollId),
            queryParameters: getVotesRequest.toJson(),
          );
      debugPrint("Response from get poll votes: ${response.data}");
      return LMResponse<GetPollVotesResponseEntity>(
        success: response.data['success'] ?? false,
        errorMessage: response.data['error_message'],
        data: response.data['data'] != null
            ? GetPollVotesResponseEntity.fromJson(response.data['data'])
            : null,
      );
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      return LMResponse<GetPollVotesResponseEntity>(
        success: false,
        errorMessage: e.message ?? "An error occurred",
      );
    }
  }
}
