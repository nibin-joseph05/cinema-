import 'package:flutter/material.dart';
import 'package:cinema_plus/app/router.dart';
import 'package:cinema_plus/core/theme/app_theme.dart';

class CinemaPlusApp extends StatelessWidget {
  const CinemaPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema+',
      theme: AppTheme.light,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
// app entry
