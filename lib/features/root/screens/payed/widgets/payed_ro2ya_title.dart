import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/payed/provider/payed_ro2ya_provider.dart';
import 'package:flutter/material.dart';

class PayedRo2yaTitle extends StatelessWidget {
  const PayedRo2yaTitle({
    super.key,
    required this.provider,
  });
  final PayedRo2yaProvider provider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.brownColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "بيانات الدفع للرؤى",
            style: AppTextStyles.title28Brown,
          ),
          CircleAvatar(
            backgroundColor: AppColors.lightBrownColor,
            child: IconButton(
              onPressed: () {
                provider.setEdit();
              },
              icon: Icon(
                Icons.edit,
                color: AppColors.brownColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
