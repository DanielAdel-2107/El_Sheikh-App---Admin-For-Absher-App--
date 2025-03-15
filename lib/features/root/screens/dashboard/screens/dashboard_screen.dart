import 'package:el_sheikh/core/widgets/custom_app_bar.dart';
import 'package:el_sheikh/features/root/screens/dashboard/widgets/dash_board_screen_body.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "لوحة التحكم",
      ),
      body: DashBoardScreenBody(),
    );
  }
}
