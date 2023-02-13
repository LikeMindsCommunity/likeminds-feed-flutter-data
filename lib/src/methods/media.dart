import 'dart:io';
import 'package:likeminds_feed/src/repositories/media_repository.dart';

/// MediaApi
/// Public API class for media related methods, such as uploading files.
class MediaApi {
  late final MediaRepository _mediaRepository;

  MediaApi({required MediaRepository mediaRepository}) {
    _mediaRepository = mediaRepository;
  }

  /// Uploads a file to the server.
  /// Returns the URL of the uploaded file.
  /// Returns null if the upload fails.
  /// [file] is the file to be uploaded.
  Future<String?> uploadFile(File file) async {
    return await _mediaRepository.uploadFile(file);
  }

  /// Uploads a file from path to the server.
  /// Returns the URL of the uploaded file.
  /// Returns null if the upload fails.
  /// [filePath] is the path of the file to be uploaded.
  Future<String?> uploadFileByPath(String filePath) async {
    return await _mediaRepository.uploadFileByPath(filePath);
  }
}
