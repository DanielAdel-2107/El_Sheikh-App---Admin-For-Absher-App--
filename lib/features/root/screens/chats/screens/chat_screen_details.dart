import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/chats/widgets/chat_screen_details_body.dart';
import 'package:flutter/material.dart';

class ChatScreenDetails extends StatelessWidget {
  const ChatScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المحادثه",
          style: AppTextStyles.title20White,
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.brownColor,
      ),
      body: ChatScreenDetailsBody(),
    );
  }
}
