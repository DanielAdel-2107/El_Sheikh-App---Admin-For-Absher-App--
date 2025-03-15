import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/dependancy_injection/dependancy_injection.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/dashboard/provider/dashboard_provider.dart';
import 'package:el_sheikh/features/root/screens/dashboard/widgets/custom_grid_view_card_ro2ya_number.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class DashBoardScreenBody extends StatelessWidget {
  const DashBoardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<DashboardProvider>(),
      child: Consumer<DashboardProvider>(
        builder: (context, provider, child) {
          return LiquidPullToRefresh(
              color: AppColors.brownColor,
              showChildOpacityTransition: false,
              onRefresh: () async {
                provider.subscribeToExplanationUpdates();
              },
              child: provider.dataLoaded == false
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "كل الرؤى",
                            style: AppTextStyles.title28Brown,
                          ),
                          Text(
                            provider.interpreterModelList.length.toString(),
                            style: AppTextStyles.title28Brown,
                          ),
                          Expanded(
                              child: CustomGridViewCardRo2yaNumber(
                                  provider: provider)),
                        ],
                      ),
                    ));
        },
      ),
    );
  }
}
