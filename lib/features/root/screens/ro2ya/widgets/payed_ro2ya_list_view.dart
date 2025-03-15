import 'package:el_sheikh/core/assets/images/app_images.dart';
import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/provider/ro2ya_provider.dart';
import 'package:el_sheikh/models/explanation_model.dart';
import 'package:flutter/material.dart';

class PayedRo2yaListView extends StatelessWidget {
  const PayedRo2yaListView({
    super.key,
    required this.ro2yaList,
    required this.payedRo2ya,
    required this.provider,
  });
  final List<ExplanationModel> ro2yaList;
  final bool payedRo2ya;
  final Ro2yaProvider provider;
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
              return CustomCard(
                interpreter: interpreter,
                trailing: payedRo2ya
                    ? IconButton(
                        onPressed: () {
                          provider.turnpayedRo2ya(
                              id: interpreter.id,
                              payed: true,
                              context: context);
                        },
                        icon: Icon(
                          Icons.domain_verification,
                          color: AppColors.brownColor,
                        ))
                    : IconButton(
                        onPressed: () {
                          provider.turnpayedRo2ya(
                              id: interpreter.id,
                              payed: false,
                              context: context);
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: AppColors.brownColor,
                        )),
              );
            },
          );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.interpreter,
    this.trailing,
  });
  final Widget? trailing;
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
        trailing: trailing,
      ),
    );
  }
}
