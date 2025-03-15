import 'package:el_sheikh/core/widgets/custom_app_bar.dart';
import 'package:el_sheikh/features/root/screens/chats/widgets/chat_screen_body.dart';
import 'package:flutter/material.dart';

class ChatsScreens extends StatelessWidget {
  const ChatsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "مراسلات",
      ),
      body: ChatScreenBody(),
    );
  }
}
