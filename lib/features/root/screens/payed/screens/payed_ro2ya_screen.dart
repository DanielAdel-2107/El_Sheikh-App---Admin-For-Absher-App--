import 'package:el_sheikh/core/widgets/custom_app_bar.dart';
import 'package:el_sheikh/features/root/screens/payed/widgets/payed_ro2ya_screen_body.dart';
import 'package:flutter/material.dart';

class PayedRo2yaScreen extends StatelessWidget {
  const PayedRo2yaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "بيانات الدفع",
      ),
      body: PayedRo2yaScreenBody(),
    );
  }
}
