import 'package:el_sheikh/core/widgets/custom_app_bar.dart';
import 'package:el_sheikh/features/root/screens/notifications/widgets/notifications_screen_body.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableMenu: false,
        enableactions: false,
        title: "الاشعارات",
      ),
      body: NotificationsScreenBody(),
    );
  }
}
