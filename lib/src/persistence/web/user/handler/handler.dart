import 'package:hive/hive.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

import 'package:likeminds_feed/src/persistence/web/user/schema/user_hive.dart';
import 'package:likeminds_feed/src/persistence/web/user/utils/utils.dart';

// This class handles all the DB operations
// related to User Data
// Accepts box names as strings
class LMUserDBHandlerHive {
  final String userBoxName;
  final String memberStateBoxName;
  late Box<LMUserHive> userBox;
  late Box<LMMemberStateHive> memberStateBox;

  LMUserDBHandlerHive({
    required this.userBoxName,
    required this.memberStateBoxName,
  });

  Future<LMResponse> init() async {
    userBox = await Hive.openBox<LMUserHive>(userBoxName);
    memberStateBox = await Hive.openBox<LMMemberStateHive>(memberStateBoxName);

    if (userBox.isOpen && memberStateBox.isOpen) {
      return LMResponse(success: true);
    } else {
      return LMResponse(success: false, errorMessage: "Failed to open box");
    }
  }

  // CRUD operation for User Model
  // Insert [User] data into local DB
  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    try {
      final userBox = await Hive.openBox<LMUserHive>(userBoxName);
      final userHiveModel = LMUserInterfaceWeb.fromUser(user);
      await userBox.put(userHiveModel.uuid, userHiveModel);
      await userBox.close();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Delete [User] data from local DB
  Future<LMResponse<void>> deleteUser() async {
    try {
      final userBox = await Hive.openBox<LMUserHive>(userBoxName);
      await userBox.clear();
      await userBox.close();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Get [User] data from local DB
  LMResponse<User> getUser() {
    try {
      final userBox = Hive.box<LMUserHive>(userBoxName);
      final userHiveModels = userBox.values.toList();

      if (userHiveModels.isEmpty) {
        return LMResponse(success: false, errorMessage: "User not found");
      }
      final user = LMUserInterfaceWeb.toUser(userHiveModels.first);
      userBox.close();
      return LMResponse(success: true, data: user);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // CRUD operation for MemberStateResponse Model
  // Get [MemberStateResponse] data from local DB
  LMResponse<MemberStateResponse> getMemberState() {
    try {
      final memberStateBox = Hive.box<LMMemberStateHive>(memberStateBoxName);
      final memberStateHiveModels = memberStateBox.values.toList();

      if (memberStateHiveModels.isEmpty) {
        return LMResponse(
            success: false, errorMessage: "MemberState not found");
      }
      final memberStateResponse =
          LMUserInterfaceWeb.toMemberState(memberStateHiveModels.first);
      memberStateBox.close();
      return LMResponse(success: true, data: memberStateResponse);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // Update [MemberStateResponse] data in local DB
  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    try {
      final memberStateBox =
          await Hive.openBox<LMMemberStateHive>(memberStateBoxName);
      final memberStateHiveModel =
          LMUserInterfaceWeb.fromMemberState(memberStateResponse);
      await memberStateBox.put(memberStateHiveModel.uuid, memberStateHiveModel);
      await memberStateBox.close();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Delete [MemberStateResponse] data from local DB
  Future<LMResponse<void>> deleteMemberState() async {
    try {
      final memberStateBox =
          await Hive.openBox<LMMemberStateHive>(memberStateBoxName);
      await memberStateBox.clear();
      await memberStateBox.close();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }
}
