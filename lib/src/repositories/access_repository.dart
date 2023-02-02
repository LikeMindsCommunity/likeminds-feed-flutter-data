import 'package:likeminds_feed/src/services/access_service.dart';

class AccessRepository {
  final AccessService accessService;

  AccessRepository({required this.accessService});

  Future<bool> getAccess(String accesType) async {
    return await accessService.getAccess(accesType);
  }

  Future<bool> getMemberState() async {
    return await accessService.getMemberState();
  }
}
