// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/branding_service.dart';

class BrandingRepository {
  final BrandingService brandingService;

  BrandingRepository({required this.brandingService});

  Future<BrandingResponse> getBranding(BrandingRequest request) async {
    final brandingEntity = await brandingService.getBranding(request);
    return BrandingResponse.fromEntity(brandingEntity);
  }
}
