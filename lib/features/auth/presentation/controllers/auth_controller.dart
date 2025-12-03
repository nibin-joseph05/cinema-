import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cinema_plus/features/auth/domain/usecases/register.dart';
import 'package:cinema_plus/core/errors/app_snackbar.dart';

class AuthController {
  final RegisterUseCase _register = RegisterUseCase();

  Future<void> register({
    required BuildContext context,
    required String username,
    required String email,
    required String password,
    required String role,
    File? image,
  }) async {
    try {
      final success = await _register(
        username: username,
        email: email,
        password: password,
        role: role,
        profilePic: image,
      );

      if (success) {
        AppSnackbar.showSuccess(context, "Registration successful");
        Navigator.pushNamed(context, "/login");
      } else {
        AppSnackbar.showError(context, "Something went wrong");
      }
    } catch (e) {
      AppSnackbar.showError(context, e.toString());
    }
  }
}
