import 'package:el_sheikh/app/my_app.dart';
import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static final TextStyle title28White = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title22Brown = TextStyle(
    color: AppColors.brownColor,
    fontSize: getResponsiveFontSize(fontSize: 22),
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title24KBrownColor = TextStyle(
    color: AppColors.brownColor,
    fontSize: getResponsiveFontSize(fontSize: 24),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title20LightBrown = TextStyle(
    color: AppColors.lightBrownColor,
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title28Brown = TextStyle(
    color: AppColors.brownColor,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title28deepPurple = TextStyle(
    color: Colors.deepPurple,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title28amber = TextStyle(
    color: Colors.amber,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title28Blue = TextStyle(
    color: Colors.blue,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title16White = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title24White = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 24),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title16Brown = TextStyle(
    color: AppColors.brownColor,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title16LightBrown = TextStyle(
    color: AppColors.lightBrownColor,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title20Brown = TextStyle(
    color: AppColors.brownColor,
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title18Brown = TextStyle(
    color: AppColors.brownColor,
    fontSize: getResponsiveFontSize(fontSize: 18),
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title18Brownsmall = TextStyle(
    color: AppColors.brownColor,
    fontSize: getResponsiveFontSize(fontSize: 18),
  );

  static final TextStyle title18grey = TextStyle(
    color: Colors.grey,
    overflow: TextOverflow.ellipsis,
    fontSize: getResponsiveFontSize(fontSize: 18),
  );

  static final TextStyle title24grey = TextStyle(
    color: Colors.grey,
    overflow: TextOverflow.ellipsis,
    fontSize: getResponsiveFontSize(fontSize: 22),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title20White = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title16Red = TextStyle(
    color: Colors.red,
    fontSize: getResponsiveFontSize(fontSize: 16),
  );

  static final TextStyle title20amber = TextStyle(
    color: Colors.amber,
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title20Black = TextStyle(
    color: Colors.black,
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title20Green = TextStyle(
    color: Colors.green,
    fontSize: getResponsiveFontSize(fontSize: 20),
  );

  static final TextStyle title18orange = TextStyle(
    color: Colors.orange,
    fontSize: getResponsiveFontSize(fontSize: 18),
  );

  static final TextStyle title22DarkPurpel = TextStyle(
    color: AppColors.darkPurpel,
    fontSize: getResponsiveFontSize(fontSize: 22),
  );
}

double getResponsiveFontSize({required double fontSize}) {
  double scaleFactor = getScaleFactor();
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor() {
  double width = MediaQuery.of(navigatorKey.currentContext!).size.width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
