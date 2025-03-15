import 'package:el_sheikh/core/widgets/custom_app_bar.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/widgets/interpreter_request_screen_body.dart';
import 'package:flutter/material.dart';

class InterpreterRequestScreen extends StatelessWidget {
  const InterpreterRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "طلبات انضمام المفسرين",
      ),
      body: InterpreterRequestScreenBody(),
    );
  }
}
