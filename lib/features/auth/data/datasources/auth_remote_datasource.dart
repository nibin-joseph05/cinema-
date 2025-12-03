import 'dart:io';
import 'package:dio/dio.dart';
import 'package:cinema_plus/core/network/dio_client.dart';

class AuthRemoteDataSource {
  final Dio _dio = DioClient.dio;

  Future<Response> registerUser({
    required String username,
    required String email,
    required String password,
    required String role,
    File? profilePic,
  }) async {
    final formData = FormData.fromMap({
      "username": username,
      "email": email,
      "password": password,
      "role": role,
      if (profilePic != null)
        "profilePic": await MultipartFile.fromFile(profilePic.path,
            filename: profilePic.path.split("/").last),
    });

    return await _dio.post("/auth/registerUser", data: formData);
  }
}
