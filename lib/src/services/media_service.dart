import 'dart:io';

import 'package:likeminds_feed/src/services/api/api_client.dart';
import 'package:simple_s3/simple_s3.dart';

///Internal media service to talk to our s3 buckets
/// and expose methods to upload and download media
class MediaService {
  final String _bucketName = "beta-likeminds-media";
  final String _region = "ap-south-1";
  final String _poolId = "ap-south-1:181963ba-f2db-450b-8199-964a941b38c2";

  late final SimpleS3 _s3Client;
  final ApiClient apiClient;

  MediaService({required this.apiClient}) {
    _s3Client = SimpleS3();
  }

  ///Uploads a file [File] to our s3 bucket
  ///Returns the url of the uploaded file
  ///Returns null if the upload fails
  Future<String?> uploadFile(File file) async {
    try {
      String result = await _s3Client.uploadFile(
        file,
        _bucketName,
        _poolId,
        AWSRegions.apSouth1,
      );
      return result;
    } on SimpleS3Errors catch (e) {
      print(e.toString());
      return null;
    }
  }

  ///Uploads a file from path [String] to our s3 bucket
  ///Returns the url of the uploaded file
  ///Returns null if the upload fails
  Future<String?> uploadFileByPath(String filePath) async {
    String result = await _s3Client.uploadFile(
      File(filePath),
      _bucketName,
      _poolId,
      AWSRegions.apSouth1,
    );
    return result;
  }

  // Future<dynamic> uploadToLM(){

  // }
}
