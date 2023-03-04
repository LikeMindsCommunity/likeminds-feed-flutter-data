import 'dart:io';

import 'package:likeminds_feed/src/services/media_service.dart';

class MediaRepository {
  final MediaService mediaService;

  MediaRepository({required this.mediaService});

  Future<String?> uploadFile(File file) async {
    return await mediaService.uploadFile(file);
  }

  Future<String?> uploadFileByPath(String filePath) async {
    return await mediaService.uploadFileByPath(filePath);
  }
}
