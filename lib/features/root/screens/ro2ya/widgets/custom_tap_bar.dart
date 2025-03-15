import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.only(left: 16),
      padding: EdgeInsets.all(0),
      indicatorColor: AppColors.brownColor,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      tabs: [
        Tab(child: CustomTabBarText(text: "كل الرؤى")),
        Tab(child: CustomTabBarText(text: "جديده")),
        Tab(child: CustomTabBarText(text: "قيد التفسير")),
        Tab(child: CustomTabBarText(text: "لم يتم الدفع ")),
        Tab(child: CustomTabBarText(text: " تم الدفع ")),
        Tab(child: CustomTabBarText(text: "قيد الاستفسار")),
        Tab(child: CustomTabBarText(text: "تم التفسير ")),
      ],
    );
  }
}

class CustomTabBarText extends StatelessWidget {
  const CustomTabBarText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.title24grey,
    );
  }
}
