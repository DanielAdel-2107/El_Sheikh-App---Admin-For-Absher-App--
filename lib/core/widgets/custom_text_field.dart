import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.isSecure = false,
    required this.title,
    this.controller,
    this.enabledEdit = true,
  });
  final TextEditingController? controller;
  final bool enabledEdit;
  final String title;
  final bool isSecure;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.lightBrownColor,
      ),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'برجاءادخال القيمه' : null,
        controller: controller,
        obscureText: isSecure,
        enabled: enabledEdit,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.brownColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          label: Center(
            child: Text(
              title,
              style: AppTextStyles.title18Brown,
            ),
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
