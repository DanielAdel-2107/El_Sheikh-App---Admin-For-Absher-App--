import 'package:el_sheikh/core/notifications/show_notification.dart';
import 'package:el_sheikh/core/routing/app_routes.dart';
import 'package:el_sheikh/features/splash/widgets/quran_splash_screen_body.dart';
import 'package:flutter/material.dart';

class QuranSplashScreen extends StatefulWidget {
  const QuranSplashScreen({super.key});

  @override
  State<QuranSplashScreen> createState() => _QuranSplashScreenState();
}

class _QuranSplashScreenState extends State<QuranSplashScreen> {
  @override
  initState() {
    super.initState();
    navigateToAbsherSplashScreen();
  }

  Future<Null> navigateToAbsherSplashScreen() {
    return Future.delayed(const Duration(seconds: 3), () {
      handleUnreadNotificationsStream();
      Navigator.pushReplacementNamed(context, AppRoutes.absherSplasheScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: QuranSplashScreenBody(),
    );
  }
}
