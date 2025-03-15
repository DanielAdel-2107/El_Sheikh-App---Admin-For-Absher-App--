import 'package:el_sheikh/core/dependancy_injection/dependancy_injection.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/provider/ro2ya_provider.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/widgets/custom_tap_bar.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/widgets/custom_tap_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ro2yaScreenBody extends StatelessWidget {
  const Ro2yaScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Ro2yaProvider>(builder: (context, provider, child) {
      if (provider.dataLoaded == false) {
        return const Center(child: CircularProgressIndicator());
      } else if (provider.errorMessage != null) {
        return Center(child: Text('Error: ${provider.errorMessage}'));
      } else if (provider.interpreterModelList.isEmpty &&
          provider.dataLoaded == true) {
        return Center(
            child: Text(
          'لا توجد رؤيا',
          style: AppTextStyles.title28Brown,
        ));
      } else {
        return Column(
          children: [
            CustomTapBar(),
            CustomTapBarView(
              provider: provider,
            )
          ],
        );
      }
    });
  }
}
