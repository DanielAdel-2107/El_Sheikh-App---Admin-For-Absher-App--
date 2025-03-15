import 'dart:developer';

import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserOpinions extends StatelessWidget {
  const CustomUserOpinions({
    super.key,
    required this.opinionsModel,
  });
  final ExplanationModel opinionsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            generateStars(opinionsModel.rating ?? ""),
            style: AppTextStyles.title20Brown,
          ),
          Text("التقييم ", style: AppTextStyles.title20LightBrown),
          Text(
            opinionsModel.userFeedback ?? "",
            style: AppTextStyles.title18Brown,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

String generateStars(String? rating) {
  if (rating == null || rating.trim().isEmpty) {
    log("Rating is null or empty. Returning empty string.");
    return "";
  }
  rating = rating.replaceAll(RegExp(r'[^\d.]'), '').trim();
  double? rate = double.tryParse(rating);
  if (rate == null || rate <= 0) {
    log("Invalid rating value: '$rating'. Returning empty string.");
    return "";
  }
  log("Parsed rating: $rate");
  int fullStars = rate.floor(); // عدد النجوم الكاملة
  bool hasHalfStar = (rate - fullStars) >= 0.5; // هل يوجد نصف نجمة؟
  String stars = "⭐" * fullStars + (hasHalfStar ? "⭐️½" : "");
  log("Generated stars: $stars");
  return stars;
}
