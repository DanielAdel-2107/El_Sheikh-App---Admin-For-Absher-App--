import 'package:el_sheikh/core/routing/app_routes.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/provider/interpreter_request_provider.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/widgets/custom_interpreter_request_screen_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InterpreterRequestScreenBody extends StatelessWidget {
  const InterpreterRequestScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<InterpreterRequestProvider>(
        builder: (context, provider, child) {
      return provider.interpreterRequests == null
          ? Center(child: CircularProgressIndicator())
          : provider.interpreterRequests!.isEmpty
              ? Center(
                  child: Text(
                  "لا توجد طلبات",
                  style: AppTextStyles.title28Brown,
                ))
              : ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  itemCount: provider.interpreterRequests!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: CustomInterpreterRequestListTile(
                        interpreterRequestModel:
                            provider.interpreterRequests![index],
                        onTap: () {
                          provider.selectInterpreterRequest(
                              interpreterRequestModel:
                                  provider.interpreterRequests![index]);
                          Navigator.pushNamed(context,
                              AppRoutes.interpreterRequestDetailsScreen);
                        },
                      ),
                    );
                  });
    });
  }
}
