import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInterpreterDetails extends StatelessWidget {
  const CustomInterpreterDetails({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      tileColor: AppColors.lightBrownColor,
      title: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.title20Brown,
          ),
          Text(
            value,
            style: AppTextStyles.title18Brownsmall,
          ),
        ],
      ),
    );
  }
}
