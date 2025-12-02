import 'package:flutter/material.dart';
import 'package:cinema_plus/core/theme/app_colors.dart';
import 'package:cinema_plus/core/theme/text_styles.dart';
import 'package:cinema_plus/features/auth/presentation/widgets/text_field.dart';
import 'package:cinema_plus/features/auth/presentation/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.height < 700;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Column(
              children: [
                const Spacer(flex: 2),

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

                SizedBox(height: isSmall ? 42 : 60),

                CustomTextField(
                  label: "Username",
                  hint: "Enter your username",
                  controller: usernameController,
                ),

                const SizedBox(height: 36),

                CustomTextField(
                  label: "Password",
                  hint: "Enter your password",
                  controller: passwordController,
                  obscure: hidden,
                  suffix: IconButton(
                    icon: Icon(
                      hidden ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () => setState(() => hidden = !hidden),
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const Spacer(flex: 3),

                PrimaryButton(
                  text: "Log in",
                  onPressed: () {
                    // TODO login validation will come later
                  },
                ),

                const SizedBox(height: 26),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account? ",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFFF55951), Color(0xFFE3006F)],
                      ).createShader(bounds),
                      child: const Text(
                        "Create one",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isSmall ? 24 : 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
