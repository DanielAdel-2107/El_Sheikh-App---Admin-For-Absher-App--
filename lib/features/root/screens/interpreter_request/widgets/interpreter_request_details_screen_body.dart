import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/widgets/custom_elevated_button_style_2.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/provider/interpreter_request_provider.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/widgets/custom_interpreter_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterpreterRequestDetailsScreenBody extends StatelessWidget {
  const InterpreterRequestDetailsScreenBody({
    super.key,
    required this.provider,
  });
  final InterpreterRequestProvider provider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Center(
        child: provider.changeStatus == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  spacing: 15.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInterpreterDetails(
                      title: "اسم المفسر",
                      value: provider.selectedInterpreterRequest!.name,
                    ),
                    CustomInterpreterDetails(
                      title: "رقم الموبايل",
                      value: provider.selectedInterpreterRequest!.phone,
                    ),
                    CustomInterpreterDetails(
                      title: "البريد الالكتروني",
                      value: provider.selectedInterpreterRequest!.email,
                    ),
                    CustomInterpreterDetails(
                      title: "العمر",
                      value: provider.selectedInterpreterRequest!.age,
                    ),
                    CustomInterpreterDetails(
                      title: "المدينه",
                      value: provider.selectedInterpreterRequest!.city,
                    ),
                    CustomInterpreterDetails(
                      title: "الجنس",
                      value: provider.selectedInterpreterRequest!.gender,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      spacing: 15.w,
                      children: [
                        Expanded(
                            child: CustomElevatedButtonStyle2(
                          title: "قبول",
                          color: AppColors.brownColor,
                          onPressed: () {
                            provider.updateRequest(
                                status: true, context: context);
                          },
                        )),
                        Expanded(
                            child: CustomElevatedButtonStyle2(
                          title: "رفض",
                          color: AppColors.brownColor,
                          onPressed: () {
                            provider.updateRequest(
                                status: false, context: context);
                          },
                        ))
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
