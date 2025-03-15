import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/core/widgets/custom_text_field.dart';
import 'package:el_sheikh/features/root/screens/payed/provider/payed_ro2ya_provider.dart';
import 'package:flutter/material.dart';

class PayedRo2yaForm extends StatelessWidget {
  const PayedRo2yaForm({
    super.key,
    required this.provider,
  });
  final PayedRo2yaProvider provider;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "عن طريق محفظه ( اورانج فودافون اتصالات ) كاش",
        //   style: AppTextStyles.title20Brown,
        //   textAlign: TextAlign.center,
        // ),
        // CustomTextField(
        //   title: "اضافة رقم المحفظه",
        //   controller: provider.mahfzaNumberController,
        //   enabledEdit: provider.enableEdit,
        // ),
        Text(
          "عن طريق انستا باى",
          style: AppTextStyles.title20Brown,
        ),
        CustomTextField(
          title: "اضافة ايميل انستا باى",
          controller: provider.instapayEmailController,
          enabledEdit: provider.enableEdit,
        ),
        Text(
          "عن طريق بطاقة بنكية",
          style: AppTextStyles.title20Brown,
        ),
        CustomTextField(
          title: "اضافة اسم البنك ",
          controller: provider.bankNameController,
          enabledEdit: provider.enableEdit,
        ),
        CustomTextField(
          title: "اضافة رقم البطاقه البنكيه",
          controller: provider.cardNumberController,
          enabledEdit: provider.enableEdit,
        ),
      ],
    );
  }
}
