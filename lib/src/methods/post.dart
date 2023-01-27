import 'package:feed_sdk/src/models/post/add_post_request_model.dart';
import 'package:feed_sdk/src/models/post/add_post_response_model.dart';
import 'package:feed_sdk/src/repositories/post_repository.dart';

class PostApi {
  final PostRepository postRepository;

  PostApi({required this.postRepository});

  Future<AddPostResponse> addPost(AddPostRequest addPostRequest) async {
    return await postRepository.addPost(addPostRequest);
  }
}
