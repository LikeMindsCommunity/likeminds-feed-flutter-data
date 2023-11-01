///Unit tests for LM Feed SDK
///To run tests, run the following command in the terminal:
///flutter test --dart-define=DEBUG=true

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/models/access/edit_profile_request.dart';
import 'package:likeminds_feed/src/models/access/edit_profile_response.dart';
import 'package:likeminds_feed/src/models/access/get_profile_request.dart';
import 'package:likeminds_feed/src/models/access/get_profile_response.dart';
import 'package:likeminds_feed/src/models/feed/user_feed_request.dart';
import 'package:likeminds_feed/src/models/feed/user_feed_response.dart';

import 'environment/test_env.dart';
import 'test_callback.dart';

/// Flutter flavour/environment manager v0.0.1
const prod = !bool.fromEnvironment('DEBUG');

//Testing credentials, and callback
final TestCallback testingCallback = TestCallback();
final String testingBetaAPIKey = EnvTest.testingBetaAPIKey;
final String testingBetaBotID = EnvTest.testingBetaBotID;
final String testingProdAPIKey = EnvTest.testingProdAPIKey;
final String testingProdBotID = EnvTest.testingProdBotID;

String? postId;

void main() {
  debugPrint("Initiating unit tests now...");
  group('Testing LMFeedClient SDK layer\n', () {
    LMFeedClient client = (LMFeedClientBuilder()
          ..apiKey(prod ? testingProdAPIKey : testingBetaAPIKey)
          ..sdkCallback(testingCallback))
        .build();

    test('Testing Initiate User', () async {
      InitiateUserRequest request = (InitiateUserRequestBuilder()
            ..userId(prod ? testingProdBotID : testingBetaBotID))
          .build();
      InitiateUserResponse response = await client.initiateUser(request);
      expect(response.success, true);
    });

    test('Testing Get Profile', () async {
      GetProfileRequest request = (GetProfileRequestBuilder()
            ..userUniqueId(prod ? testingProdBotID : testingBetaBotID))
          .build();
      GetProfileResponse response = await client.getProfile(request);
      expect(response.success, true);
    });

    test('Testing Edit Profile', () async {
      String currentTimeStamp =
          DateTime.now().millisecondsSinceEpoch.toString();
      EditProfileRequest request = (EditProfileRequestBuilder()
            ..name(prod ? testingProdBotID : testingBetaBotID)
            ..imageUrl(currentTimeStamp)
            ..userUniqueId(prod ? testingProdBotID : testingBetaBotID))
          .build();
      EditProfileResponse response = await client.editProfile(request);
      expect(response.success, true);
    });

    test('Testing the community configurations APi', () async {
      GetCommunityConfigurationsResponse response =
          await client.getCommunityConfigurations();
      expect(response, isNotNull);
    });

    test('Testing Get Universal Feed', () async {
      GetFeedRequest request = (GetFeedRequestBuilder()
            ..page(1)
            ..pageSize(10))
          .build();
      GetFeedResponse? response = await client.getFeed(request);
      expect(response, isNotNull);
    });

    test('Testing Get Feed Room', () async {
      GetUserFeedRequest request = (GetUserFeedRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..userId(prod ? testingProdBotID : testingBetaBotID))
          .build();
      GetUserFeedResponse? response = await client.getUserFeed(request);
      expect(response, isNotNull);
      debugPrint('-----------------------------------');
      debugPrint('${response.success}');
      debugPrint('${response.posts}');
      debugPrint('${response.topics}');
      debugPrint('${response.users}');
      debugPrint('-----------------------------------');
    });

    test('Testing Get Notification Feed', () async {
      GetNotificationFeedRequest request = (GetNotificationFeedRequestBuilder()
            ..page(1)
            ..pageSize(10))
          .build();
      GetNotificationFeedResponse? response =
          await client.getNotificationFeed(request);
      expect(response, isNotNull);
    });

    test('Testing Get Unread Count for Notification Feed', () async {
      GetUnreadNotificationCountResponse? response =
          await client.getUnreadNotificationCount();
      expect(response, isNotNull);
    });

    test('Testing Add Post', () async {
      AddPostRequest request = (AddPostRequestBuilder()
            ..attachments([])
            ..feedroomId(72200)
            ..text('Test post from SDK'))
          .build();
      AddPostResponse response = await client.addPost(request);
      if (response.success) {
        postId = response.post!.id;
      }
      expect(response, isNotNull);
    });

    test('Testing Get Post', () async {
      GetPostRequest request = (GetPostRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..postId(postId ?? ""))
          .build();
      GetPostResponse response = await client.getPost(request);
      expect(response, isNotNull);
    });

    test('Testing Like Post', () async {
      LikePostRequest request =
          (LikePostRequestBuilder()..postId(postId ?? "")).build();
      LikePostResponse response = await client.likePost(request);
      expect(response, isNotNull);
    });

    test('Testing Pin Post', () async {
      PinPostRequest request =
          (PinPostRequestBuilder()..postId(postId ?? "")).build();
      PinPostResponse response = await client.pinPost(request);
      expect(response, isNotNull);
    });

    test('Testing Save Post', () async {
      SavePostRequest request =
          (SavePostRequestBuilder()..postId(postId ?? "")).build();
      SavePostResponse response = await client.savePost(request);
      expect(response, isNotNull);
    });

    test('Testing Edit Post', () async {
      EditPostRequest request = (EditPostRequestBuilder()
            ..postId(postId ?? "")
            ..postText("Post text edited")
            ..attachments([]))
          .build();
      EditPostResponse response = await client.editPost(request);
      expect(response, isNotNull);
    });

    test('Testing Get Post Likes', () async {
      GetPostLikesRequest request = (GetPostLikesRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..postId(postId ?? ""))
          .build();
      GetPostLikesResponse response = await client.getPostLikes(request);
      expect(response, isNotNull);
    });

    String? commentId;

    test('Testing Add Comment', () async {
      AddCommentRequest request = (AddCommentRequestBuilder()
            ..postId(postId ?? "")
            ..text("Comment text"))
          .build();
      AddCommentResponse response = await client.addComment(request);
      if (response.success) {
        commentId = response.reply!.id;
      }
      expect(response, isNotNull);
    });

    test('Testing Edit Comment', () async {
      EditCommentRequest request = (EditCommentRequestBuilder()
            ..postId(postId ?? "")
            ..commentId(commentId ?? "")
            ..text("Comment text edited"))
          .build();
      EditCommentResponse response = await client.editComment(request);
      if (response.success) {
        commentId = response.reply!.id;
      }
      expect(response, isNotNull);
    });

    test('Testing Get Comment', () async {
      GetCommentRequest request = (GetCommentRequestBuilder()
            ..postId(postId ?? "")
            ..commentId(commentId ?? "")
            ..page(1))
          .build();
      GetCommentResponse response = await client.getComment(request);
      expect(response, isNotNull);
    });

    test('Testing Toggle Comment Like', () async {
      ToggleLikeCommentRequest request = (ToggleLikeCommentRequestBuilder()
            ..postId(postId ?? "")
            ..commentId(commentId ?? ""))
          .build();
      ToggleLikeCommentResponse response = await client.likeComment(request);

      expect(response, isNotNull);
    });

    test('Testing Get Comment Likes', () async {
      GetCommentLikesRequest request = (GetCommentLikesRequestBuilder()
            ..commentId(commentId ?? "")
            ..page(1)
            ..pageSize(10)
            ..postId(postId ?? ""))
          .build();
      GetCommentLikesResponse response = await client.getCommentLikes(request);
      expect(response, isNotNull);
    });

    String? replyId;

    test('Testing Add Comment Reply', () async {
      AddCommentReplyRequest request = (AddCommentReplyRequestBuilder()
            ..commentId(commentId ?? "")
            ..text("Comment Reply Request")
            ..postId(postId ?? ""))
          .build();
      AddCommentReplyResponse response = await client.addCommentReply(request);
      if (response.success) {
        replyId = response.reply!.id;
      }
      expect(response, isNotNull);
    });

    test('Testing Edit Comment Reply', () async {
      EditCommentReplyRequest request = (EditCommentReplyRequestBuilder()
            ..commentId(commentId ?? "")
            ..text("Comment Reply Edited")
            ..postId(postId ?? "")
            ..replyId(replyId ?? ""))
          .build();
      EditCommentReplyResponse response =
          await client.editCommentReply(request);
      expect(response, isNotNull);
    });

    test('Testing Delete Comment', () async {
      DeleteCommentRequest request = (DeleteCommentRequestBuilder()
            ..commentId(commentId ?? "")
            ..postId(postId ?? "")
            ..reason("Reason for deletion"))
          .build();
      DeleteCommentResponse response = await client.deleteComment(request);
      expect(response, isNotNull);
    });

    test('Testing Delete Post', () async {
      DeletePostRequest request = (DeletePostRequestBuilder()
            ..deleteReason("Reason for deletion")
            ..postId(postId ?? ""))
          .build();
      DeletePostResponse response = await client.deletePost(request);
      expect(response, isNotNull);
    });

    // logout call without LMSDKCallback
    test('Testing Logout without LMSDKCallback', () async {
      LogoutRequest request = (LogoutRequestBuilder()
            ..deviceId("deviceId")
            ..refreshToken("refreshToken"))
          .build();
      expect(request, isNotNull);
    });
  });
}
