import 'package:likeminds_feed/src/repositories/access_repository.dart';

class AccessApi {
  final AccessRepository accessRepository;

  AccessApi({required this.accessRepository});

  Future<bool> getAccess(String accesType) async {
    return await accessRepository.getAccess(accesType);
  }

  Future<bool> getMemberState() async {
    return await accessRepository.getMemberState();
  }
}
