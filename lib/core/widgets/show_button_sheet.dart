import 'package:el_sheikh/core/colors/app_colors.dart';
import 'package:el_sheikh/core/widgets/custom_elevated_button_style_2.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/provider/ro2ya_provider.dart';
import 'package:el_sheikh/models/explanation_model.dart';
import 'package:el_sheikh/models/interpreter_model.dart';
import 'package:flutter/material.dart';

showBottomSheetWidget(BuildContext context,
    {required Ro2yaProvider provider, required ExplanationModel interpreter}) {
  return showBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (context) {
      return Container(
        height: MediaQuery.sizeOf(context).height / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              provider.interpreterModels == []
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : DropdownButtonFormField<InterpreterModel>(
                      decoration: const InputDecoration(
                        labelText: 'اختار مفسر للرؤيا',
                        border: OutlineInputBorder(),
                      ),
                      value: provider.selectedModel,
                      items: provider.interpreterModels.map((model) {
                        return DropdownMenuItem<InterpreterModel>(
                          value: model,
                          child: Text(model.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        provider.selectInterpreter(value!);
                      }),
              SizedBox(height: 50),
              CustomElevatedButtonStyle2(
                title: "ارسال",
                color: AppColors.brownColor,
                onPressed: () async {
                  await provider.sendRo2ya(
                    context: context,
                    interpreter: interpreter,
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
