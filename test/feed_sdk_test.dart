/// Unit tests for LM Feed SDK
/// To run tests, run the following command in the terminal:
/// flutter test --dart-define=DEBUG=true
library;

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

import 'environment/test_env.dart';
import 'helper.dart';

/// Flutter flavour/environment manager v0.0.1
const prod = !bool.fromEnvironment('DEBUG');

//Testing credentials, and callback
//final TestCallback testingCallback = TestCallback();
final String testingBetaAPIKey = EnvTest.testingBetaAPIKey;
final String testingBetaBotID = EnvTest.testingBetaBotID;
final String testingProdAPIKey = EnvTest.testingProdAPIKey;
final String testingProdBotID = EnvTest.testingProdBotID;

String? postId;

LMFeedClient setupLMFeed() {
  return LMFeedClient.builder().build();
}

void main() {
  debugPrint("Initiating unit tests now...");
  group('Testing LMFeedClient SDK layer\n', () {
    late LMFeedClient client;
    String? pollId;
    String? optionId;
    test('Testing Initiate User', () async {
      client = setupLMFeed();

      InitiateUserRequest request = (InitiateUserRequestBuilder()
            ..apiKey(prod ? testingProdAPIKey : testingBetaAPIKey)
            ..userName("userName")
            ..uuid(prod ? testingProdBotID : testingBetaBotID))
          .build();
      InitiateUserResponse response = await client.initiateUser(request);
      expect(response.success, true);

      expect(response.user!.sdkClientInfo.uuid,
          prod ? testingProdBotID : testingBetaBotID);
    });

    test('Testing Get Profile', () async {
      GetProfileRequest request = (GetProfileRequestBuilder()
            ..uuid(prod ? testingProdBotID : testingBetaBotID))
          .build();
      GetProfileResponse response = await client.getProfile(request);
      expect(response.success, true);

      expect(response.member!.sdkClientInfo.uuid,
          prod ? testingProdBotID : testingBetaBotID);
    });

    test('Testing Edit Profile', () async {
      String currentTimeStamp =
          DateTime.now().millisecondsSinceEpoch.toString();
      EditProfileRequest request = (EditProfileRequestBuilder()
            ..name(prod ? testingProdBotID : testingBetaBotID)
            ..imageUrl(currentTimeStamp)
            ..uuid(prod ? testingProdBotID : testingBetaBotID))
          .build();
      EditProfileResponse response = await client.editProfile(request);
      debugPrint("Edit Profile Response: ${response.success}");
      expect(response.success, true);
    });

    test('Testing the community configurations APi', () async {
      GetCommunityConfigurationsResponse response =
          await client.getCommunityConfigurations();
      expect(response.success, true);

      expect(response.communityConfigurations, isNotNull);
    });

    test('Testing Get Universal Feed', () async {
      GetFeedRequest request = (GetFeedRequestBuilder()
            ..page(1)
            ..pageSize(10))
          .build();
      GetFeedResponse response = await client.getUniversalFeed(request);
      expect(response.success, true);
    });

    test('Testing Get Feed Room', () async {
      GetUserPostRequest request = (GetUserPostRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..uuid(prod ? testingProdBotID : testingBetaBotID))
          .build();
      GetUserPostResponse? response = await client.getUserCreatedPosts(request);
      expect(response.success, true);
    });

    test('Testing Get Notification Feed', () async {
      GetNotificationFeedRequest request = (GetNotificationFeedRequestBuilder()
            ..page(1)
            ..pageSize(10))
          .build();
      GetNotificationFeedResponse? response =
          await client.getNotificationFeed(request);
      expect(response.success, true);
    });

    test('Testing Get Unread Count for Notification Feed', () async {
      GetUnreadNotificationCountResponse? response =
          await client.getUnreadNotificationCount();

      expect(response.success, true);
    });

    test('Testing Get User Activity', () async {
      GetUserActivityRequest request = (GetUserActivityRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..uuid(prod ? testingProdBotID : testingBetaBotID))
          .build();
      GetUserActivityResponse? response = await client.getUserActivity(request);

      expect(response.success, true);
    });

    test('Testing Add Post', () async {
      String postText = "Test post from SDK";

      String tempId = "-${DateTime.now().millisecondsSinceEpoch.toString()}";
      Attachment attachment = Attachment(
        attachmentType: 6,
        attachmentMeta: AttachmentMeta(
          pollQuestion: "Poll Question",
          allowAddOption: true,
          pollType: "instant",
          pollOptions: ["Option 1", "Option 2"],
          expiryTime: DateTime.now().millisecondsSinceEpoch + 1000000,
        ),
      );
      AddPostRequest request = (AddPostRequestBuilder()
            ..attachments([attachment])
            // ..feedroomId(72200)
            ..tempId(tempId)
            ..text(postText))
          .build();
      AddPostResponse response = await client.addPost(request);
      if (response.success) {
        postId = response.post!.id;
        pollId = response.post!.attachments![0].attachmentMeta.entityId!;
        optionId = response.widgets![pollId]!.lmMeta!['options'][0]['_id'];
      }

      expect(response.success, true);

      expect(response.post!.text, postText);

      expect(response.post!.tempId, tempId);
    });

    test('Testing Get Post', () async {
      GetPostRequest request = (GetPostRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..postId(postId ?? ""))
          .build();
      GetPostResponse response = await client.getPost(request);
      expect(response.success, true);

      expect(response.post!.id, postId);
    });

    test('Testing Like Post', () async {
      LikePostRequest request =
          (LikePostRequestBuilder()..postId(postId ?? "")).build();
      LikePostResponse response = await client.likePost(request);

      expect(response.success, true);
    });

    test('Testing Pin Post', () async {
      PinPostRequest request =
          (PinPostRequestBuilder()..postId(postId ?? "")).build();
      PinPostResponse response = await client.pinPost(request);

      expect(response.success, true);
    });

    test('Testing Save Post', () async {
      SavePostRequest request =
          (SavePostRequestBuilder()..postId(postId ?? "")).build();
      SavePostResponse response = await client.savePost(request);
      expect(response.success, true);
    });

    test('Testing Get Saved Post', () async {
      GetSavedPostRequest request = (GetSavedPostRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..uuid(prod ? testingProdBotID : testingBetaBotID))
          .build();
      GetSavedPostResponse response = await client.getSavedPost(request);
      expect(response.success, true);
    });

    test('Testing Get Saved Post', () async {
      GetSavedPostRequest request = (GetSavedPostRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..uuid(prod ? testingProdBotID : testingBetaBotID))
          .build();
      GetSavedPostResponse response = await client.getSavedPost(request);
      expect(response.success, true);
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

    test('Testing Search Post', () async {
      SearchPostRequest request = (SearchPostRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..search("post for test")
            ..searchType("text"))
          .build();
      final response = await client.searchPosts(request);

      log("Search Post Response: ${response.posts?.length}");
      expect(response.success, true);
    });

    test('Testing Submit Poll Vote', () async {
      debugPrint("Poll ID: $pollId");
      debugPrint("Option ID: $optionId");
      SubmitPollVoteRequest request = (SubmitPollVoteRequestBuilder()
            ..pollId(pollId ?? "")
            ..votes([optionId ?? ""]))
          .build();
      LMResponse<void> response = await client.submitPollVote(request);
      debugPrint("Submit Poll Vote Response: ${response.success}");
      expect(response.success, true);
    });

    test('Testing Add Poll Option', () async {
      AddPollOptionRequest request = (AddPollOptionRequestBuilder()
            ..pollId(pollId ?? "")
            ..text("Option 3"))
          .build();
      LMResponse<AddPollOptionResponse> response =
          await client.addPollOption(request);
      debugPrint('''
Add Poll Option Response: ${response.data?.widget?.lmMeta?["options"]}''');
      expect(response.success, true);
    });

    test('Testing Get Poll Votes', () async {
      GetPollVotesRequest request = (GetPollVotesRequestBuilder()
            ..pollId(pollId ?? "")
            ..votes([optionId ?? ""]))
          .build();
      LMResponse<GetPollVotesResponse> response =
          await client.getPollVotes(request);
      debugPrint("Get Poll Votes Response: ${response.data?.votes}");
      expect(response.success, true);
    });

    test('Testing Edit Post', () async {
      String postEditedText = "Post text edited";

      EditPostRequest request = (EditPostRequestBuilder()
            ..postId(postId ?? "")
            ..postText(postEditedText)
            ..attachments([]))
          .build();
      EditPostResponse response = await client.editPost(request);
      expect(response.success, true);

      expect(response.post!.text, postEditedText);

      expect(response.post!.id, postId);
    });

    test('Testing Get Post Likes', () async {
      GetPostLikesRequest request = (GetPostLikesRequestBuilder()
            ..page(1)
            ..pageSize(10)
            ..postId(postId ?? ""))
          .build();
      GetPostLikesResponse response = await client.getPostLikes(request);
      expect(response.success, true);
    });

    test('Testing Add Comment', () async {
      String commentText = "Test comment from SDK";

      String tempId = "-${DateTime.now().millisecondsSinceEpoch.toString()}";

      AddCommentRequest request = (AddCommentRequestBuilder()
            ..postId(postId ?? "")
            ..text(commentText)
            ..tempId(tempId))
          .build();
      AddCommentResponse response = await client.addComment(request);
      if (response.success) {
        commentId = response.reply!.id;
      }
      expect(response.success, true);

      expect(response.reply!.text, commentText);

      expect(response.reply!.tempId, tempId);
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
      expect(response.success, true);

      expect(response.reply!.id, commentId);

      expect(response.reply!.text, "Comment text edited");
    });

    test('Testing Get Comment', () async {
      GetCommentRequest request = (GetCommentRequestBuilder()
            ..postId(postId ?? "")
            ..commentId(commentId ?? "")
            ..page(1))
          .build();
      GetCommentResponse response = await client.getComment(request);

      expect(response.success, true);

      expect(response.postReplies!.id, commentId);
    });

    test('Testing Toggle Comment Like', () async {
      ToggleLikeCommentRequest request = (ToggleLikeCommentRequestBuilder()
            ..postId(postId ?? "")
            ..commentId(commentId ?? ""))
          .build();
      ToggleLikeCommentResponse response = await client.likeComment(request);

      expect(response.success, true);
    });

    test('Testing Get Comment Likes', () async {
      GetCommentLikesRequest request = (GetCommentLikesRequestBuilder()
            ..commentId(commentId ?? "")
            ..page(1)
            ..pageSize(10)
            ..postId(postId ?? ""))
          .build();
      GetCommentLikesResponse response = await client.getCommentLikes(request);

      expect(response.success, true);
    });

    test('Testing Add Comment Reply', () async {
      String replyText = "Test comment reply from SDK";

      String tempId = "-${DateTime.now().millisecondsSinceEpoch.toString()}";

      AddCommentReplyRequest request = (AddCommentReplyRequestBuilder()
            ..commentId(commentId ?? "")
            ..text(replyText)
            ..tempId(tempId)
            ..postId(postId ?? ""))
          .build();
      AddCommentReplyResponse response = await client.addCommentReply(request);

      if (response.success) {
        replyId = response.reply!.id;
      }

      expect(response.success, true);

      expect(response.reply!.text, replyText);

      expect(response.reply!.tempId, tempId);

      expect(response.reply!.parentComment!.id, commentId);
    });

    test('Testing Edit Comment Reply', () async {
      String replyText = "Comment Reply Edited";

      EditCommentReplyRequest request = (EditCommentReplyRequestBuilder()
            ..commentId(commentId ?? "")
            ..text(replyText)
            ..postId(postId ?? "")
            ..replyId(replyId ?? ""))
          .build();
      EditCommentReplyResponse response =
          await client.editCommentReply(request);

      expect(response.success, true);

      expect(response.reply!.text, replyText);

      expect(response.reply!.parentComment!.id, commentId);
    });

    test('Testing Delete Comment', () async {
      DeleteCommentRequest request = (DeleteCommentRequestBuilder()
            ..commentId(commentId ?? "")
            ..postId(postId ?? "")
            ..reason("Reason for deletion"))
          .build();
      DeleteCommentResponse response = await client.deleteComment(request);

      expect(response.success, true);
    });

    test('Testing Delete Post', () async {
      DeletePostRequest request = (DeletePostRequestBuilder()
            ..deleteReason("Reason for deletion")
            ..postId(postId ?? ""))
          .build();
      DeletePostResponse response = await client.deletePost(request);
      expect(response.success, true);
    });

    // MARK - Block Feature Testing
    String newUserId =
        "new-user-${DateTime.now().millisecondsSinceEpoch.toString()}";
    String newUserName = "newUserName";

    test('Testing Block User', () async {
      await testInitiateUser(
          prod,
          (InitiateUserRequest.builder()
                ..apiKey(prod ? testingProdAPIKey : testingBetaAPIKey)
                ..userName(newUserName)
                ..uuid(newUserId))
              .build());
      BlockUserRequest request = (BlockUserRequestBuilder()
            ..uuid(newUserId)
            ..shouldBlock(true))
          .build();
      LMResponse<void> response = await client.toggleBlock(request);
      expect(response.success, true);
    });

    test('Testing Add Block User in BlockedTest', () async {
      GetBlockedUsersRequest request = (GetBlockedUsersRequestBuilder()
            ..userUUID(prod ? testingProdBotID : testingBetaBotID))
          .build();
      LMResponse<GetBlockedUsersResponse> response =
          await client.getBlockedUsers(request);

      List<User> blockedUsers = response.data?.blockedUsers ?? [];

      int index = blockedUsers
          .indexWhere((user) => user.sdkClientInfo.uuid == newUserId);

      expect(index != -1, true);
    });

    test('Testing Unblock User', () async {
      BlockUserRequest request = (BlockUserRequestBuilder()
            ..uuid(newUserId)
            ..shouldBlock(false))
          .build();
      LMResponse<void> response = await client.toggleBlock(request);
      expect(response.success, true);
    });

    test('Testing Remove Block User in BlockedTest', () async {
      GetBlockedUsersRequest request = (GetBlockedUsersRequestBuilder()
            ..userUUID(prod ? testingProdBotID : testingBetaBotID))
          .build();
      LMResponse<GetBlockedUsersResponse> response =
          await client.getBlockedUsers(request);

      List<User> blockedUsers = response.data?.blockedUsers ?? [];

      int index = blockedUsers
          .indexWhere((user) => user.sdkClientInfo.uuid == newUserId);

      expect(index == -1, true);
    });

    // logout call without LMSDKCallback
    test('Testing Logout without LMSDKCallback', () async {
      String deviceId = "deviceId";

      String refreshToken = "refreshToken";

      LogoutRequest request = (LogoutRequestBuilder()
            ..deviceId(deviceId)
            ..refreshToken(refreshToken))
          .build();
      expect(request, isNotNull);

      expect(request.deviceId, deviceId);

      expect(request.refreshToken, refreshToken);
    });
  });
}
