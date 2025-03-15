import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/provider/ro2ya_provider.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/widgets/custom_user_options.dart';
import 'package:el_sheikh/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Ro2yaDetailsScreen extends StatelessWidget {
  const Ro2yaDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل الرؤيا"),
        backgroundColor: AppColors.brownColor,
        foregroundColor: Colors.white,
      ),
      body: Consumer<Ro2yaProvider>(builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "يمكنك اظهار او اخفاء التعليق والرؤيا ",
                style: AppTextStyles.title22Brown,
              ),
              CustomUserFeedBack(
                explanationModel: provider.explanationModel!,
                onChanged: (value) {
                  provider.turnRo2yaFeedbackVisible(
                      context: context,
                      value: !provider.explanationModel!.visiblityFeedback);
                },
              ),
              provider.explanationModel?.ro2yaUrl == null
                  ? TextRo2yaVisibility(
                      ro2ya: provider.explanationModel!.ro2ya,
                      ro2yavisiblity: provider.explanationModel!.visiblity,
                      onChanged: (value) {
                        provider.turnRo2yaVisible(
                            context: context,
                            value: !provider.explanationModel!.visiblity);
                      },
                    )
                  : VoiceRo2ya(
                      ro2ya: provider.explanationModel!.ro2ya,
                      ro2yavisiblity: provider.explanationModel!.visiblity,
                      icon: provider.isPlaying ? Icons.pause : Icons.play_arrow,
                      onChanged: (value) {
                        provider.turnRo2yaVisible(
                            context: context,
                            value: !provider.explanationModel!.visiblity);
                      },
                      onPressed: () {
                        if (provider.isPlaying) {
                          provider.stopPlayRecording();
                        } else {
                          provider.playRecording(
                              provider.explanationModel!.ro2yaUrl!);
                        }
                      },
                    )
            ],
          ),
        );
      }),
    );
  }
}

class CustomUserFeedBack extends StatelessWidget {
  const CustomUserFeedBack({
    super.key,
    required this.explanationModel,
    this.onChanged,
  });
  final ExplanationModel explanationModel;
  final Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.lightBrownColor,
        child: Column(
          children: [
            SwitchListTile(
                title: Text(
                  "التعليق",
                  style: AppTextStyles.title18Brown,
                ),
                value: explanationModel.visiblityFeedback,
                onChanged: onChanged),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: explanationModel.userFeedback == null
                  ? Text(
                      "لم يتم التعليق على الرؤيا",
                      style: AppTextStyles.title20Brown,
                    )
                  : CustomUserOpinions(opinionsModel: explanationModel),
            )
          ],
        ));
  }
}

class TextRo2yaVisibility extends StatelessWidget {
  const TextRo2yaVisibility(
      {super.key,
      required this.ro2ya,
      this.onChanged,
      required this.ro2yavisiblity});
  final String ro2ya;
  final bool ro2yavisiblity;
  final Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.lightBrownColor,
        child: Column(
          children: [
            SwitchListTile(
                title: Text(
                  "الرؤيا",
                  style: AppTextStyles.title18Brown,
                ),
                value: ro2yavisiblity,
                onChanged: onChanged),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                child: Text(
                  ro2ya,
                  style: AppTextStyles.title20Brown,
                ))
          ],
        ));
  }
}

class VoiceRo2ya extends StatelessWidget {
  const VoiceRo2ya(
      {super.key,
      required this.ro2ya,
      required this.ro2yavisiblity,
      this.onChanged,
      required this.icon,
      this.onPressed});
  final String ro2ya;
  final bool ro2yavisiblity;
  final Function(bool)? onChanged;
  final IconData? icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.lightBrownColor,
        child: Column(
          children: [
            SwitchListTile(
                title: Text(
                  "الرؤيا",
                  style: AppTextStyles.title18Brown,
                ),
                value: ro2yavisiblity,
                onChanged: onChanged),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Text(
                ro2ya,
                style: AppTextStyles.title20Brown,
              ),
            ),
            IconButton(onPressed: onPressed, icon: Icon(icon))
          ],
        ));
  }
}
