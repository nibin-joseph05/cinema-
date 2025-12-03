import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:cinema_plus/core/theme/app_colors.dart';
import 'package:cinema_plus/core/theme/text_styles.dart';
import 'package:cinema_plus/features/auth/presentation/widgets/primary_button.dart';

import '../../../../core/errors/app_snackbar.dart';
import '../controllers/auth_controller.dart';
import '../widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  String? role;
  File? imageFile;

  final List<String> roles = ["User", "Admin"];

  void pickImage() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      setState(() => imageFile = File(result.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.height < 700;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backgroundDark,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Column(
              children: [
                const SizedBox(height: 32),

                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFF55951), Color(0xFFE3006F)],
                  ).createShader(bounds),
                  child: Text(
                    "Cinema+",
                    style: TextStyles.headingLarge.copyWith(
                      fontSize: isSmall ? 34 : 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Enter your data",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: isSmall ? 36 : 48),


                GestureDetector(
                  onTap: pickImage,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white.withOpacity(0.15),
                    backgroundImage:
                    imageFile != null ? FileImage(imageFile!) : null,
                    child: imageFile == null
                        ? const Icon(Icons.camera_alt,
                        color: Colors.white, size: 32)
                        : null,
                  ),
                ),

                const SizedBox(height: 32),

                CustomTextField(
                  label: "Username",
                  hint: "Enter your username",
                  controller: usernameController,
                ),
                const SizedBox(height: 32),

                CustomTextField(
                  label: "Email",
                  hint: "Enter your email",
                  controller: emailController,
                ),
                const SizedBox(height: 32),

                CustomTextField(
                  label: "Password",
                  hint: "Enter your password",
                  controller: passwordController,
                  obscure: true,
                ),
                const SizedBox(height: 32),

                CustomTextField(
                  label: "Confirm Password",
                  hint: "Re-enter your password",
                  controller: confirmPassController,
                  obscure: true,
                ),
                const SizedBox(height: 32),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Role",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.5),
                          width: 1.3,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: role,
                          dropdownColor: const Color(0xFF1B143F),
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.white),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          items: roles
                              .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                              .toList(),
                          onChanged: (value) => setState(() => role = value),
                          hint: Text(
                            "Select role",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.45),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isSmall ? 36 : 48),

                const Text(
                  "By registering with Cinema you are accepting the terms and data\nmanagement policies",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                SizedBox(height: isSmall ? 36 : 48),

                PrimaryButton(
                  text: "Sign up",
                  onPressed: () {
                    final username = usernameController.text.trim();
                    final email = emailController.text.trim();
                    final password = passwordController.text;
                    final confirmPass = confirmPassController.text;

                    final usernameRegex = RegExp(r'^[a-zA-Z]+$');
                    if (username.isEmpty || !usernameRegex.hasMatch(username)) {
                      AppSnackbar.showError(context, "Username must contain only letters");
                      return;
                    }

                    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(email)) {
                      AppSnackbar.showError(context, "Enter a valid email address");
                      return;
                    }

                    final passRegex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
                    );
                    if (!passRegex.hasMatch(password)) {
                      AppSnackbar.showError(
                        context,
                        "Password must be 8+ chars & include uppercase, lowercase, number & symbol",
                      );
                      return;
                    }

                    if (password != confirmPass) {
                      AppSnackbar.showError(context, "Passwords do not match");
                      return;
                    }

                    if (role == null) {
                      AppSnackbar.showError(context, "Please select a role");
                      return;
                    }

                    final controller = AuthController();
                    controller.register(
                      context: context,
                      username: username,
                      email: email,
                      password: password,
                      role: role!,
                      image: imageFile,
                    );

                  },
                ),


                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
