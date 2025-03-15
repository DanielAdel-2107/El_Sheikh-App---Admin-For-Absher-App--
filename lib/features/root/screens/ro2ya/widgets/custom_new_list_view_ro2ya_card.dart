import 'package:el_sheikh/core/assets/images/app_images.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/core/widgets/show_button_sheet.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/provider/ro2ya_provider.dart';
import 'package:el_sheikh/models/explanation_model.dart';
import 'package:flutter/material.dart';

class CustomListViewRo2yaCard extends StatelessWidget {
  const CustomListViewRo2yaCard({
    super.key,
    required this.interpreter,
    required this.provider,
  });

  final ExplanationModel interpreter;
  final Ro2yaProvider provider;
  @override
  Widget build(BuildContext context) {
    return CustomCard(provider: provider, interpreter: interpreter);
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.provider,
    required this.interpreter,
  });
  final Ro2yaProvider provider;
  final ExplanationModel interpreter;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          showBottomSheetWidget(context,
              provider: provider, interpreter: interpreter);
        },
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(AppImages.absherSplashImage),
          ),
          title: Text(
            interpreter.userName,
            style: AppTextStyles.title20Brown,
          ),
          subtitle: Text(
            interpreter.ro2ya,
            style: AppTextStyles.title18grey,
          ),
        ),
      ),
    );
  }
}
