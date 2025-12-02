import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cinema_plus/features/auth/presentation/widgets/primary_button.dart';
import 'package:cinema_plus/core/theme/text_styles.dart';
import 'package:cinema_plus/core/theme/app_colors.dart';

import '../../../../app/router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.height < 700;

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.07,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * (isSmall ? 0.32 : 0.38),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(
                    'assets/welcome/camera-canvas.webp',
                  ),
                ),
              ),

              SizedBox(height: isSmall ? 36 : 64),

              Text(
                'Cinema+',
                style: TextStyles.headingLarge.copyWith(
                  fontSize: isSmall ? 30 : 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: isSmall ? 36 : 60),

              PrimaryButton(
                text: "Get start",
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.selectCity);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
