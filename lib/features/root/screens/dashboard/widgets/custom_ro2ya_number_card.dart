import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomRo2yaNumberCard extends StatelessWidget {
  const CustomRo2yaNumberCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });
  final String title;
  final String count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.title24White.copyWith(color: color),
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
          Text(count),
        ],
      ),
    );
  }
}
