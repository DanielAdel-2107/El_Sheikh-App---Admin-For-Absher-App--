import 'package:el_sheikh/features/root/screens/ro2ya/provider/ro2ya_provider.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/widgets/new_ro2ya_list_view.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/widgets/payed_ro2ya_list_view.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/widgets/ro2ya_list_view.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/widgets/ro2ya_state_list_view.dart';
import 'package:flutter/material.dart';

class CustomTapBarView extends StatelessWidget {
  const CustomTapBarView({
    super.key,
    required this.provider,
  });
  final Ro2yaProvider provider;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabBarView(children: [
      Ro2yaStateListView(
        ro2yaList: provider.interpreterModelList,
      ),
      NewRo2yaListView(
        ro2yaList: provider.newRo2ya,
        provider: provider,
      ),
      Ro2yaListView(
        ro2yaList: provider.waitExplanationRo2ya,
      ),
      PayedRo2yaListView(
        ro2yaList: provider.notPayedRo2ya,
        provider: provider,
        payedRo2ya: true,
      ),
      PayedRo2yaListView(
        ro2yaList: provider.payedRo2ya,
        provider: provider,
        payedRo2ya: false,
      ),
      Ro2yaListView(
        ro2yaList: provider.inquiryRo2ya,
      ),
      Ro2yaListView(
        ro2yaList: provider.explanationDoneRo2ya,
      ),
    ]));
  }
}
