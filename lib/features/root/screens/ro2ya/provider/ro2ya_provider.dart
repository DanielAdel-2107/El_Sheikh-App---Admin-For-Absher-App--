// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:el_sheikh/core/notifications/add_notification.dart';
import 'package:el_sheikh/models/explanation_model.dart';
import 'package:el_sheikh/models/interpreter_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Ro2yaProvider with ChangeNotifier {
  List<ExplanationModel> interpreterModelList = [];
  List<ExplanationModel> newRo2ya = [];
  List<ExplanationModel> inquiryRo2ya = [];
  List<ExplanationModel> waitExplanationRo2ya = [];
  List<ExplanationModel> explanationDoneRo2ya = [];
  List<ExplanationModel> payedRo2ya = [];
  List<ExplanationModel> notPayedRo2ya = [];

  String? errorMessage;
  bool dataLoaded = false;
  Ro2yaProvider() {
    _subscribeToExplanationUpdates();
    getData();
  }
  void _subscribeToExplanationUpdates() {
    interpreterModelList.clear();
    dataLoaded = false;
    notifyListeners();
    Supabase.instance.client
        .from('explanation')
        .stream(primaryKey: ['id']).listen((event) {
      interpreterModelList =
          event.map((data) => ExplanationModel.fromJson(data)).toList();
      newRo2ya.clear();
      inquiryRo2ya.clear();
      waitExplanationRo2ya.clear();
      explanationDoneRo2ya.clear();
      payedRo2ya.clear();
      notPayedRo2ya.clear();
      for (var element in interpreterModelList) {
        if (element.interpreterId == null) {
          newRo2ya.add(element);
        }
        if (element.doneExplanation == false) {
          waitExplanationRo2ya.add(element);
        }
        if (element.userFeedback == null) {
          inquiryRo2ya.add(element);
        }
        if (element.payed == false) {
          notPayedRo2ya.add(element);
        }
        if (element.payed == true) {
          payedRo2ya.add(element);
        }
        if (element.doneExplanation == true) {
          explanationDoneRo2ya.add(element);
        }
        log(explanationDoneRo2ya.length.toString());
      }
      dataLoaded = true;
      notifyListeners();
    }).onError((error) {
      dataLoaded = false;
      notifyListeners();
      Future.delayed(Duration(seconds: 2), () {
        _subscribeToExplanationUpdates();
      });
      dataLoaded = true;
      notifyListeners();
    });
  }

  /////////
  turnpayedRo2ya(
      {required String id,
      required BuildContext context,
      required bool payed}) async {
    await Supabase.instance.client.from('explanation').update(
      {
        'payed': payed,
      },
    ).eq("id", id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("تم تغيير حالة الدفع بنجاح"),
      ),
    );
  }

  /////////
  List<InterpreterModel> interpreterModels = [];
  InterpreterModel? selectedModel;
  selectInterpreter(InterpreterModel model) {
    selectedModel = model;
    notifyListeners();
  }

  final supabase = Supabase.instance.client;
  sendRo2ya(
      {required ExplanationModel interpreter,
      required BuildContext context}) async {
    await supabase.from('explanation').update(
      {
        'interpreter_id': selectedModel!.id,
        'interpreter_name': selectedModel!.name,
        'interpreter_email': selectedModel!.email,
        'returned_ro2ya': false
      },
    ).eq("id", interpreter.id);
    await supabase.from('chats').upsert({
      'interpreter_name': selectedModel!.name,
      'user_name': interpreter.userName,
      'ro2ya_title': interpreter.ro2yaName,
      "id": interpreter.id,
      'interpreter_close': false,
      'user_colse': false,
      'done_explanation': false
    });
    log(interpreter.id.toString());
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("تم ارسال الرؤى بنجاح"),
      ),
    );
    addNotification(
        selectedModel!.id, "رؤيا جديده", "تم ارسال رؤيا جديده برجاء تفسيرها");
    notifyListeners();
  }

  getData() async {
    interpreterModels.clear();
    try {
      final supabase = Supabase.instance.client;
      final data = await supabase.from('interpreter').select();
      for (var element in data) {
        if (element["available"] == true && element["status"] == true) {
          interpreterModels.add(InterpreterModel.fromJson(element));
        }
      }
      notifyListeners();
      log(interpreterModels.toString());
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  //
  ExplanationModel? explanationModel;
  selectRo2ya(ExplanationModel model) {
    explanationModel = model;
    notifyListeners();
  }

  //
  turnRo2yaVisible({required BuildContext context, required bool value}) async {
    await Supabase.instance.client.from('explanation').update(
      {
        'visiblity': value,
      },
    ).eq("id", explanationModel!.id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("تم تغيير حالة الرؤيا بنجاح"),
      ),
    );
    Navigator.pop(context);
  }

  ////
  turnRo2yaFeedbackVisible(
      {required BuildContext context, required bool value}) async {
    if (explanationModel!.userFeedback != null) {
      await Supabase.instance.client.from('explanation').update(
        {
          'visiblity_feedback': value,
        },
      ).eq("id", explanationModel!.id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("تم تغيير حالة الرؤيا بنجاح"),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("لن تستطيع اظهار التعليق لان اليوزر لم يعلق بعد"),
        ),
      );
    }
  }

  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playRecording(String url) async {
    isPlaying = true;
    notifyListeners();
    _audioPlayer.onPlayerComplete.listen((event) {
      stopPlayRecording();
    });
    await _audioPlayer.play(UrlSource(url));
  }

  Future<void> stopPlayRecording() async {
    await _audioPlayer.stop();
    isPlaying = false;
    notifyListeners();
  }
}
