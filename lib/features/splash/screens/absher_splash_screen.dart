import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/features/splash/widgets/absher_splash_screen_bodt.dart';
import 'package:flutter/material.dart';

class AbsherSplashScreen extends StatefulWidget {
  const AbsherSplashScreen({super.key});

  @override
  State<AbsherSplashScreen> createState() => _AbsherSplashScreenState();
}

class _AbsherSplashScreenState extends State<AbsherSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brownColor,
      body: AbsherSplashScreenBody(),
    );
  }
}
