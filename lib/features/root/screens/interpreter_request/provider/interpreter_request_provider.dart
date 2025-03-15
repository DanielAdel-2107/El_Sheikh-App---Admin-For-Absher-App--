import 'dart:developer';

import 'package:el_sheikh/models/interpreter_request_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InterpreterRequestProvider with ChangeNotifier {
  final supabase = Supabase.instance.client;
  List<InterpreterRequestModel>? interpreterRequests;
  InterpreterRequestProvider() {
    getInterpreterRequest();
  }

  getInterpreterRequest() {
    try {
      supabase
          .from('interpreter_request')
          .stream(primaryKey: ['id']).listen((data) {
        interpreterRequests =
            data.map((e) => InterpreterRequestModel.fromJson(e)).toList();
        notifyListeners();
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  InterpreterRequestModel? selectedInterpreterRequest;
  selectInterpreterRequest(
      {required InterpreterRequestModel interpreterRequestModel}) async {
    selectedInterpreterRequest = interpreterRequestModel;
    notifyListeners();
  }

  bool changeStatus = false;
  updateRequest({
    required bool status,
    required BuildContext context,
  }) async {
    try {
      changeStatus = true;
      notifyListeners();
      await supabase.from('interpreter').upsert({
        'status': status,
        "id": selectedInterpreterRequest!.id,
      }).eq('id', selectedInterpreterRequest!.id);
      await supabase
          .from("interpreter_request")
          .delete()
          .eq("id", selectedInterpreterRequest!.id);
      status == false
          ? {
              await supabase
                  .from("users")
                  .delete()
                  .eq("id", selectedInterpreterRequest!.id),
              await supabase
                  .from("interpreter")
                  .delete()
                  .eq("id", selectedInterpreterRequest!.id),
            }
          : null;
      status == true
          ? {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("تم قبول الطلب")))
            }
          : {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("تم رفض الطلب")))
            };

      Navigator.pop(context);
    } on Exception catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    changeStatus = false;
    notifyListeners();
  }
}
