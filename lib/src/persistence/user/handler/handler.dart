import 'package:hive/hive.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/user/schema/user_hive.dart';
import 'package:likeminds_feed/src/persistence/user/utils/utils.dart';

// This class handles all the DB operations
// related to User Data
// Accepts box names as strings
class LMUserDBHandlerHive {
  final String userBoxName;
  final String memberStateBoxName;
  late Box<LMUserDB> userBox;
  late Box<LMMemberStateDB> memberStateBox;

  LMUserDBHandlerHive({
    required this.userBoxName,
    required this.memberStateBoxName,
  });

  Future<LMResponse> init() async {
    try {
      final lmMemberRightDBAdapter = LMMemberRightDBAdapter();
      final lmMemberStateDBAdapter = LMMemberStateDBAdapter();
      final lmSDKClientInfoDBAdapter = LMSDKClientInfoDBAdapter();
      final lmUserDBAdapter = LMUserDBAdapter();

      if (!Hive.isAdapterRegistered(lmMemberRightDBAdapter.typeId)) {
        Hive.registerAdapter(lmMemberRightDBAdapter);
      }
      if (!Hive.isAdapterRegistered(lmMemberStateDBAdapter.typeId)) {
        Hive.registerAdapter(lmMemberStateDBAdapter);
      }
      if (!Hive.isAdapterRegistered(lmSDKClientInfoDBAdapter.typeId)) {
        Hive.registerAdapter(lmSDKClientInfoDBAdapter);
      }
      if (!Hive.isAdapterRegistered(lmUserDBAdapter.typeId)) {
        Hive.registerAdapter(lmUserDBAdapter);
      }

      userBox = await Hive.openBox<LMUserDB>(userBoxName);
      memberStateBox = await Hive.openBox<LMMemberStateDB>(memberStateBoxName);

      if (userBox.isOpen && memberStateBox.isOpen) {
        return LMResponse(success: true);
      } else {
        return LMResponse(success: false, errorMessage: "Failed to open box");
      }
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // CRUD operation for User Model
  // Insert [User] data into local DB
  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    try {
      final userHiveModel = LMUserInterfaceWeb.fromUser(user);
      await userBox.put(userHiveModel.uuid, userHiveModel);
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
      await userBox.clear();
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
      final userHiveModels = userBox.values.toList();

      if (userHiveModels.isEmpty) {
        return LMResponse(success: false, errorMessage: "User not found");
      }
      final user = LMUserInterfaceWeb.toUser(userHiveModels.first);
      return LMResponse(success: true, data: user);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // CRUD operation for MemberStateResponse Model
  // Get [MemberStateResponse] data from local DB
  LMResponse<MemberStateResponse> getMemberState() {
    try {
      final memberStateHiveModels = memberStateBox.values.toList();

      if (memberStateHiveModels.isEmpty) {
        return LMResponse(
            success: false, errorMessage: "MemberState not found");
      }
      final memberStateResponse =
          LMUserInterfaceWeb.toMemberState(memberStateHiveModels.first);
      return LMResponse(success: true, data: memberStateResponse);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // Update [MemberStateResponse] data in local DB
  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    try {
      final memberStateHiveModel =
          LMUserInterfaceWeb.fromMemberState(memberStateResponse);
      await memberStateBox.put(memberStateHiveModel.uuid, memberStateHiveModel);
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
      await memberStateBox.clear();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }
}
