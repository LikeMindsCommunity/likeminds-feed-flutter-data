import 'package:likeminds_feed/src/repositories/branding_repository.dart';
import 'package:likeminds_feed/src/models/models.dart';

class BrandingApi {
  final BrandingRepository brandingRepository;

  BrandingApi({required this.brandingRepository});

  Future<BrandingResponse> getBranding(BrandingRequest request) async {
    return await brandingRepository.getBranding(request);
  }
}
