import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/provider/ro2ya_provider.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/widgets/custom_new_list_view_ro2ya_card.dart';
import 'package:el_sheikh/models/explanation_model.dart';
import 'package:flutter/material.dart';

class NewRo2yaListView extends StatelessWidget {
  const NewRo2yaListView({
    super.key,
    required this.ro2yaList,
    this.onTap,
    required this.provider,
  });
  final Ro2yaProvider provider;
  final List<ExplanationModel> ro2yaList;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ro2yaList.isEmpty
        ? Center(
            child: Text(
            "لا توجد رؤيا جديده",
            style: AppTextStyles.title28Brown,
          ))
        : ListView.builder(
            itemCount: ro2yaList.length,
            itemBuilder: (context, index) {
              return CustomListViewRo2yaCard(
                interpreter: ro2yaList[index],
                provider: provider,
              );
            },
          );
  }
}
