import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/access_service.dart';

class AccessRepository {
  final AccessService accessService;

  AccessRepository({required this.accessService});

  // Future<bool> getAccess(String accesType) async {
  //   return await accessService.getAccess(accesType);
  // }

  Future<MemberStateResponse> getMemberState() async {
    final response = await accessService.getMemberState();
    return MemberStateResponse.fromEntity(response);
  }

  Future<GetProfileResponse> getProfile(GetProfileRequest request) async {
    final response = await accessService.getProfile(request);
    return GetProfileResponse.fromEntity(response);
  }

  Future<EditProfileResponse> editProfile(EditProfileRequest request) async {
    final response = await accessService.editProfile(request);
    return EditProfileResponse.fromEntity(response);
  }
}
