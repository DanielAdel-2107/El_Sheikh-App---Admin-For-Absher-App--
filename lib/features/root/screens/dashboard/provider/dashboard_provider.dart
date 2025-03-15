import 'package:el_sheikh/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardProvider with ChangeNotifier {
  List<ExplanationModel> interpreterModelList = [];
  List<ExplanationModel> newRo2ya = [];
  List<ExplanationModel> inquiryRo2ya = [];
  List<ExplanationModel> waitExplanationRo2ya = [];
  List<ExplanationModel> explanationDoneRo2ya = [];
  String? errorMessage;
  bool dataLoaded = false;
  DashboardProvider() {
    subscribeToExplanationUpdates();
  }

  void subscribeToExplanationUpdates() {
    interpreterModelList.clear();
    Supabase.instance.client
        .from('explanation')
        .stream(primaryKey: ['id']).listen((event) {
      interpreterModelList =
          event.map((data) => ExplanationModel.fromJson(data)).toList();
      newRo2ya.clear();
      inquiryRo2ya.clear();
      waitExplanationRo2ya.clear();
      explanationDoneRo2ya.clear();
      for (var element in interpreterModelList) {
        if (element.interpreterName == null) {
          newRo2ya.add(element);
        }
        if (element.doneExplanation == false) {
          waitExplanationRo2ya.add(element);
        }
        if (element.userFeedback == null) {
          inquiryRo2ya.add(element);
        }
        if (element.doneExplanation == true) {
          explanationDoneRo2ya.add(element);
        }
      }
      dataLoaded = true;
      notifyListeners();
    });
  }
}
