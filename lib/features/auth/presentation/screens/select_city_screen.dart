import 'package:flutter/material.dart';
import 'package:cinema_plus/core/theme/app_colors.dart';
import 'package:cinema_plus/core/theme/text_styles.dart';
import 'package:cinema_plus/features/auth/presentation/widgets/primary_button.dart';

import '../../../../app/router.dart';
import '../../../../core/errors/app_snackbar.dart';
import '../widgets/city_select_field.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({super.key});

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  String? selectedCity;
  final List<String> cities = [
    'Kochi',
    'Idukki',
    'Kottayam',
    'Trivandrum',
    'Calicut',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.height < 700;

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Column(
            children: [
              const Spacer(flex: 2),

              const Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 6),

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

              SizedBox(height: isSmall ? 38 : 48),

              CitySelectField(
                items: cities,
                value: selectedCity,
                onChanged: (value) => setState(() => selectedCity = value),
              ),

              const Spacer(flex: 3),

              PrimaryButton(
                text: "Continue",
                onPressed: () {
                  // if (selectedCity == null) {
                  //   AppSnackbar.showError(context, "Please select a city to continue");
                  //   return;
                  // }

                  Navigator.pushNamed(context, AppRouter.login);
                },
              ),

              SizedBox(height: isSmall ? 32 : 48),
            ],
          ),
        ),
      ),
    );
  }
}
