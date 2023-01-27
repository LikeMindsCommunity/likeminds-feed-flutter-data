import 'package:dio/dio.dart';
import 'package:feed_sdk/src/endpoints.dart';
import 'package:feed_sdk/src/models/post/add_post_request_model.dart';
import 'package:feed_sdk/src/models/post/add_post_response_model.dart';
import 'package:feed_sdk/src/services/api/api_client.dart';

abstract class IPostService {
  Future<AddPostResponseEntity> addPost(AddPostRequestEntity addPostRequest);
  // Future<GetPostResponse> getPost(GetPostRequest getPostRequest);
  // Future<GetPostLikesResponse> getPostLikes(
  //     GetPostLikesRequest getPostLikesRequest);
  // Future<DeletePostResponse> deletePost(DeletePostRequest deletePostRequest);
  // Future<LikePostResponse> likePost(LikePostResponse likePostResponse);
}

class PostService extends IPostService {
  final String apiKey;
  final ApiClient apiClient;

  PostService({
    required this.apiKey,
    required this.apiClient,
  });

  @override
  Future<AddPostResponseEntity> addPost(
      AddPostRequestEntity addPostRequest) async {
    try {
      final response = await apiClient.client().post(
            ADD_POST_ENDPOINT,
            data: addPostRequest.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      print("Response from add post: ${response.data}");
      AddPostResponseEntity addPostResponseEntity =
          AddPostResponseEntity.fromJson(response.data);
      return addPostResponseEntity;
    } on DioError catch (e) {
      AddPostResponseEntity addPostResponseEntity =
          AddPostResponseEntity.fromJson(e.response?.data);
      return addPostResponseEntity;
    }
  }
}
