import 'dart:io';
import '../../data/repositories/auth_repository_impl.dart';

class RegisterUseCase {
  final AuthRepositoryImpl _repo = AuthRepositoryImpl();

  Future<bool> call({
    required String username,
    required String email,
    required String password,
    required String role,
    File? profilePic,
  }) {
    return _repo.register(
      username: username,
      email: email,
      password: password,
      role: role,
      profilePic: profilePic,
    );
  }
}
