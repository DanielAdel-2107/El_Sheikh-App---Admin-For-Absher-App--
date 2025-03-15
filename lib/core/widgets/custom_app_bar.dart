import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/routing/app_routes.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "كل الرؤى",
    this.enableMenu = true,
    this.enableactions = true,
  });
  final String title;
  final bool enableMenu;
  final bool enableactions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      )),
      backgroundColor: AppColors.brownColor,
      title: Text(
        title,
        style: AppTextStyles.title24White,
      ),
      centerTitle: true,
      actions: [
        enableactions
            ? IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.notificationScreen);
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              )
            : SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
