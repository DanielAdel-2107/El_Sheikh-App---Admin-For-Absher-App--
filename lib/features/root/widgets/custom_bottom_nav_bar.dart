import 'package:el_sheikh/core/assets/images/app_images.dart';
import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/features/root/provider/bottom_navigation_bar_provider.dart';
import 'package:flutter/material.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    super.key,
    required this.provider,
  });
  final BottomNavigationBarProvider provider;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        provider.currentIndex = value;
      },
      selectedItemColor: AppColors.brownColor,
      unselectedItemColor: Colors.grey,
      currentIndex: provider.currentIndex,
      selectedFontSize: 20,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.ro2ya,
              height: 25,
            ),
            label: "كل الرؤى "),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: "لوحة التحكم"),
        BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined), label: "يبانات الدفع "),
        BottomNavigationBarItem(
            icon: Icon(Icons.call_missed_outgoing_outlined),
            label: "طلبات المفسرين"),
      ],
    );
  }
}
