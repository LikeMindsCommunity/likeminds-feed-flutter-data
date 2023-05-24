import 'package:likeminds_feed/src/models/auth/member_state_response_model.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';

class AccessApi {
  final AccessRepository accessRepository;

  AccessApi({required this.accessRepository});

  Future<MemberStateResponse> getMemberState() async {
    return await accessRepository.getMemberState();
  }
}
