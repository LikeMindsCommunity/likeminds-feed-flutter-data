import 'package:likeminds_feed/src/models/access/edit_profile_request.dart';
import 'package:likeminds_feed/src/models/access/edit_profile_response.dart';
import 'package:likeminds_feed/src/models/access/get_profile_request.dart';
import 'package:likeminds_feed/src/models/access/get_profile_response.dart';
import 'package:likeminds_feed/src/models/auth/member_state_response_model.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';

class AccessApi {
  final AccessRepository accessRepository;

  AccessApi({required this.accessRepository});

  Future<MemberStateResponse> getMemberState() async {
    return await accessRepository.getMemberState();
  }

  Future<GetProfileResponse> getProfile(GetProfileRequest request) async {
    return await accessRepository.getProfile(request);
  }

  Future<EditProfileResponse> editProfile(EditProfileRequest request) async {
    return await accessRepository.editProfile(request);
  }
}
