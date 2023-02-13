import 'dart:io';

import 'package:likeminds_feed/src/environment/env.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';
import 'package:simple_s3/simple_s3.dart';

///Internal media service to talk to our s3 buckets
/// and expose methods to upload and download media
class MediaService {
  final ApiClient apiClient;
  late final SimpleS3 _s3Client;

  late final String _bucketName;
  late final String _poolId;
  final _region = AWSRegions.apSouth1;

  MediaService({required this.apiClient}) {
    _s3Client = SimpleS3();
    if (apiClient.isProduction) {
      _bucketName = EnvProd.bucketName;
      _poolId = EnvProd.poolId;
    } else {
      _bucketName = EnvDev.bucketName;
      _poolId = EnvDev.poolId;
    }
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
        _region,
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
    try {
      String result = await _s3Client.uploadFile(
        File(filePath),
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
}
