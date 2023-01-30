import 'dart:io';

import 'package:feed_sdk/src/repositories/media_repository.dart';

class MediaApi {
  final MediaRepository mediaRepository;

  MediaApi({required this.mediaRepository});

  Future<String?> uploadFile(File file) async {
    return await mediaRepository.uploadFile(file);
  }

  Future<String?> uploadFileByPath(String filePath) async {
    return await mediaRepository.uploadFileByPath(filePath);
  }
}
