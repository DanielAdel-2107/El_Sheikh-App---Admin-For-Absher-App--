import 'package:el_sheikh/core/routing/app_routes.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/chats/provider/chats_provider.dart';
import 'package:el_sheikh/features/root/screens/chats/widgets/chat_screen_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatsProvider>(
      builder: (context, provider, child) {
        return provider.loadChats == false
            ? Center(child: CircularProgressIndicator())
            : provider.chatList.isEmpty
                ? Center(
                    child: Text(
                    "لا توجد مراسلات",
                    style: AppTextStyles.title28Brown,
                  ))
                : ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    itemCount: provider.chatList.length,
                    itemBuilder: (context, index) {
                      final chat = provider.chatList[index];
                      return ChatScreenCard(
                        chat: chat,
                        onTap: () async {
                          await provider.selectedChat(chatModel: chat);
                          Navigator.pushNamed(
                              context, AppRoutes.chatsScreenDetails);
                        },
                      );
                    },
                  );
      },
    );
  }
}
