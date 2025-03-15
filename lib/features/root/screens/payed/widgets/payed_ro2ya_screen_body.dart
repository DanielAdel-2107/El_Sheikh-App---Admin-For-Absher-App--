import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/dependancy_injection/dependancy_injection.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/core/widgets/custom_elevated_button_style_2.dart';
import 'package:el_sheikh/features/root/screens/payed/provider/payed_ro2ya_provider.dart';
import 'package:el_sheikh/features/root/screens/payed/widgets/payed_ro2ya_form.dart';
import 'package:el_sheikh/features/root/screens/payed/widgets/payed_ro2ya_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PayedRo2yaScreenBody extends StatelessWidget {
  const PayedRo2yaScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<PayedRo2yaProvider>(),
      child: Consumer<PayedRo2yaProvider>(
        builder: (context, provider, child) {
          return provider.dataUpdated
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PayedRo2yaTitle(
                            provider: provider,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          PayedRo2yaForm(
                            provider: provider,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          provider.enableEdit
                              ? CustomElevatedButtonStyle2(
                                  title: "تعديل البيانات",
                                  color: AppColors.brownColor,
                                  onPressed: () {
                                    provider.updatePayment(context: context);
                                  },
                                )
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.brownColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "للتعديل اضغط علي زرار التعديل من اعلي وقم باضافة البيانات",
                                      style: AppTextStyles.title16LightBrown,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
