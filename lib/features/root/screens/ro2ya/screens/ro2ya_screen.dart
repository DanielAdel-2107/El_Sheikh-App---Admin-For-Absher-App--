import 'package:el_sheikh/core/widgets/custom_app_bar.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/widgets/ro2ya_screen_body.dart';
import 'package:flutter/material.dart';

class Ro2yaScreen extends StatelessWidget {
  const Ro2yaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: CustomAppBar(),
          body: Ro2yaScreenBody(),
        ));
  }
}
