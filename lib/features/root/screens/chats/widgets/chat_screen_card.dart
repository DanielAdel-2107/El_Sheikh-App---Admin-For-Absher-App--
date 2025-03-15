import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChatScreenCard extends StatelessWidget {
  const ChatScreenCard({
    super.key,
    required this.chat,
    this.onTap,
  });

  final ChatModel chat;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightBrownColor,
      child: ListTile(
        onTap: onTap,
        title: Text(
          chat.ro2yaName,
          style: AppTextStyles.title20Brown,
        ),
        trailing: Container(
            padding: EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 8.0.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0.r),
              color: AppColors.brownColor,
            ),
            child: Text(
                chat.doneExplanation
                    ? "تم التفسير"
                    : chat.messages!.isEmpty
                        ? "لم تبداء"
                        : (chat.userClose || chat.interpreterClose) == false
                            ? "جاريه الان"
                            : "انتهت",
                style: AppTextStyles.title16LightBrown)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "المفسر: ${chat.interpreterName}",
              style: AppTextStyles.title16Brown,
            ),
            Text(
              "المستخدم: ${chat.userName}",
              style: AppTextStyles.title16Brown,
            ),
            SizedBox(height: 8),
            Text(
              "التاريخ: ${DateFormat.yMMMMEEEEd('ar').format(DateTime.parse(chat.createdAt))}",
              style: AppTextStyles.title16Brown,
            ),
            Text(
              "السبب: ${chat.interpreterClose ? "انتهت من المفسر" : chat.userClose ? "انتهت من العميل" : chat.doneExplanation ? "تم التفسير" : "لم تغلق"}",
              style: AppTextStyles.title16Brown,
            ),
          ],
        ),
      ),
    );
  }
}
