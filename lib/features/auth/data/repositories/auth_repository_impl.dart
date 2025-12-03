import 'dart:io';
import 'package:cinema_plus/features/auth/data/datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource _remote = AuthRemoteDataSource();

  Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String role,
    File? profilePic,
  }) async {
    final response = await _remote.registerUser(
      username: username,
      email: email,
      password: password,
      role: role,
      profilePic: profilePic,
    );

    return response.statusCode == 200;
  }
}
