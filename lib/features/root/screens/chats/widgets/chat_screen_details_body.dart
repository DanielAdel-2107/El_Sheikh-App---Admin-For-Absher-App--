import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/core/widgets/custom_elevated_button_style_2.dart';
import 'package:el_sheikh/features/root/screens/chats/provider/chats_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatScreenDetailsBody extends StatelessWidget {
  const ChatScreenDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatsProvider>(
      builder: (context, provider, child) {
        final chat = provider.selectedChatModel!.messages;
        return Stack(
          children: [
            chat!.isEmpty
                ? Center(
                    child: Text(
                      "لا يوجد رسائل",
                      style: AppTextStyles.title28Brown,
                    ),
                  )
                : ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                    itemCount: chat.length,
                    itemBuilder: (context, index) {
                      return BubbleSpecialThree(
                        text: chat[index].message,
                        color: chat[0].id == chat[index].id
                            ? AppColors.brownColor
                            : AppColors.lightBrownColor,
                        isSender: chat[0].id == chat[index].id,
                        tail: true,
                        textStyle: TextStyle(color: Colors.white, fontSize: 16),
                      );
                    },
                  ),
            Positioned(
              bottom: 20.h,
              left: 10.w,
              right: 10.w,
              child: Column(
                spacing: 20.h,
                children: [
                  CustomElevatedButtonStyle2(
                    title: "انهاء المحادثه",
                    onPressed: () {
                      provider.closeChat(context: context);
                    },
                    color: AppColors.brownColor,
                  ),
                  CustomElevatedButtonStyle2(
                    title: "حذف المحادثه",
                    onPressed: () {
                      provider.deleteChat(context: context);
                    },
                    color: AppColors.brownColor,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
