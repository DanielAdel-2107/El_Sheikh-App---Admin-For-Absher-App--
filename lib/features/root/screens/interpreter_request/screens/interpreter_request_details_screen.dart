import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/provider/interpreter_request_provider.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/widgets/interpreter_request_details_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InterpreterRequestDetailsScreen extends StatelessWidget {
  const InterpreterRequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InterpreterRequestProvider>(
        builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.brownColor,
          title: Text(provider.selectedInterpreterRequest!.name),
        ),
        body: InterpreterRequestDetailsScreenBody(
          provider: provider,
        ),
      );
    });
  }
}
