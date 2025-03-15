import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/routing/app_routes.dart';
import 'package:el_sheikh/features/root/provider/bottom_navigation_bar_provider.dart';
import 'package:el_sheikh/features/root/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BottomNavigationBarProvider(),
        child: Consumer<BottomNavigationBarProvider>(
          builder: (context, provider, child) {
            return Scaffold(
              body: provider.screens[provider.currentIndex],
              bottomNavigationBar: CustomButtomNavBar(
                provider: provider,
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.brownColor,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.chatsScreen);
                },
                child: const Icon(
                  Icons.chat_rounded,
                  color: Colors.white,
                ),
              ),
            );
          },
        ));
  }
}
