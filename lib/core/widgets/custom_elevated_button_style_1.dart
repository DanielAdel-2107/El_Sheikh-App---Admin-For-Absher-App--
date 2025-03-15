import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonStyle1 extends StatelessWidget {
  const CustomElevatedButtonStyle1({
    super.key,
    this.onPressed,
    required this.title,
  });
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightBrownColor,
          foregroundColor: AppColors.brownColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
        child: Text(
          title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
