import 'package:el_sheikh/core/assets/images/app_images.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/models/explanation_model.dart';
import 'package:flutter/material.dart';

class Ro2yaListView extends StatelessWidget {
  const Ro2yaListView({
    super.key,
    required this.ro2yaList,
  });
  final List<ExplanationModel> ro2yaList;
  @override
  Widget build(BuildContext context) {
    return ro2yaList.isEmpty
        ? Center(
            child: Text(
            "لا توجد رؤيا",
            style: AppTextStyles.title28Brown,
          ))
        : ListView.builder(
            itemCount: ro2yaList.length,
            itemBuilder: (context, index) {
              final interpreter = ro2yaList[index];
              return CustomCard(interpreter: interpreter);
            },
          );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.interpreter,
  });

  final ExplanationModel interpreter;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(AppImages.absherSplashImage)),
        title: Text(
          interpreter.userName,
          style: AppTextStyles.title20Brown,
        ),
        subtitle: Text(
          interpreter.ro2ya,
          style: AppTextStyles.title18grey,
        ),
      ),
    );
  }
}
