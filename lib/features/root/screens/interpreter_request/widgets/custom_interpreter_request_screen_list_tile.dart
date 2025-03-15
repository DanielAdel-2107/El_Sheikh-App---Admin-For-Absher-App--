import 'package:el_sheikh/core/assets/images/app_images.dart';
import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/models/interpreter_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomInterpreterRequestListTile extends StatelessWidget {
  const CustomInterpreterRequestListTile({
    super.key,
    required this.interpreterRequestModel,
    this.onTap,
  });
  final InterpreterRequestModel interpreterRequestModel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: AppColors.lightBrownColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      minTileHeight: 70.h,
      leading: CircleAvatar(
        backgroundImage: AssetImage(AppImages.absherSplashImage),
      ),
      title: Text(interpreterRequestModel.name),
      trailing: Text(DateFormat.yMMMMEEEEd('ar')
          .format(DateTime.parse(interpreterRequestModel.createdAt))),
    );
  }
}
