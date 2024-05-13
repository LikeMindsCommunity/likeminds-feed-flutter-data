import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/user/schema/user_db.dart';
import 'package:likeminds_feed/src/persistence/user/utils/utils.dart';
import 'package:realm/realm.dart' hide User;

// This class handles all the DB operations
// related to User Data
// Accepts a [Configuration] instance as parameter
class LMUserDBHandler {
  Configuration config;

  LMUserDBHandler({required this.config});

  // CRUD operation for User Model
  // Insert [User] data into local DB
  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
   
    try {
       Realm realm =await Realm.open(config);
      LMUserRO userDBModel = LMUserInterface.fromUser(user);

      await realm.writeAsync(() {
        realm.add(userDBModel, update: true);
      });

      realm.close();

      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      // realm.close();
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Delete [User] data from local DB
  Future<LMResponse<void>> deleteUser() async {
    Realm realm = Realm(config);
    try {
      RealmResults<LMUserRO>? results = realm.all<LMUserRO>();

      if (results.isNotEmpty) {
        await realm.writeAsync(() {
          realm.deleteMany(results);
        });
      } else {
        return LMResponse(success: false, errorMessage: "User not found");
      }

      realm.close();

      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      realm.close();

      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Get [User] data from local DB
  LMResponse<User> getUser() {
    Realm realm = Realm(config);
    try {
      RealmResults<LMUserRO> userRO = realm.all<LMUserRO>();

      if (userRO.isEmpty) {
        return LMResponse(success: false, errorMessage: "User not found");
      }

      User user = LMUserInterface.toUser(userRO.first);

      realm.close();

      return LMResponse(success: true, data: user);
    } on Exception catch (e) {
      realm.close();

      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // CRUD operation for MemberStateResponse Model
  // Get [MemberStateResponse] data from local DB
  LMResponse<MemberStateResponse> getMemberState() {
    Realm realm = Realm(config);
    try {
      RealmResults<LMMemberStateRO> memberStateRO =
          realm.all<LMMemberStateRO>();

      if (memberStateRO.isEmpty) {
        return LMResponse(
            success: false, errorMessage: "MemberState not found");
      }

      MemberStateResponse? memberStateResponse =
          LMUserInterface.toMemberState(memberStateRO.first);

      realm.close();

      return LMResponse(success: true, data: memberStateResponse);
    } on Exception catch (e) {
      realm.close();

      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // Update [MemberStateResponse] data in local DB
  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    Realm realm = Realm(config);
    try {
      LMMemberStateRO memberStateDBModel =
          LMUserInterface.fromMemberState(memberStateResponse);

      await realm.writeAsync(() {
        return realm.add(memberStateDBModel, update: true);
      });

      realm.close();

      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      realm.close();
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Delete [MemberStateResponse] data from local DB
  Future<LMResponse<void>> deleteMemberState() async {
    Realm realm = Realm(config);
    try {
      RealmResults<LMMemberStateRO> memberStateRO =
          realm.all<LMMemberStateRO>();

      if (memberStateRO.isEmpty) {
        return LMResponse<void>(
          errorMessage: "MemberState not found",
          success: false,
        );
      }

      await realm.writeAsync(() {
        realm.deleteMany(memberStateRO);
      });

      realm.close();

      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      realm.close();

      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }
}
