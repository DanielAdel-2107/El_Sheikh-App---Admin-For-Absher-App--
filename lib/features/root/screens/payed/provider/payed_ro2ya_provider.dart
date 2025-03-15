import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PayedRo2yaProvider with ChangeNotifier {
  bool dataUpdated = true;
  final mahfzaNumberController = TextEditingController();
  final cardNumberController = TextEditingController();
  final bankNameController = TextEditingController();
  final instapayEmailController = TextEditingController();
  final supabase = Supabase.instance.client;
  bool enableEdit = false;
  ////////
  setEdit() {
    enableEdit = !enableEdit;
    notifyListeners();
  }

  ////////
  PayedRo2yaProvider() {
    getPaymentData();
  }
  ////////
  getPaymentData() async {
    final response = await supabase.from('payment').select().eq("id", "1");
    try {
      if (response.isNotEmpty) {
        mahfzaNumberController.text = response[0]['mahfza_number'] ?? "";
        cardNumberController.text = response[0]['card_number'] ?? "";
        bankNameController.text = response[0]['bank_name'] ?? "";
        instapayEmailController.text = response[0]['instapay_email'] ?? "";
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    dataUpdated = false;
    notifyListeners();
  }

  ////////
  updatePayment({required BuildContext context}) async {
    dataUpdated = true;
    notifyListeners();

    await supabase.from('payment').upsert({
      'id': "1",
      'mahfza_number': mahfzaNumberController.text,
      'card_number': cardNumberController.text,
      'bank_name': bankNameController.text,
      'instapay_email': instapayEmailController.text,
    });
    dataUpdated = false;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('تم التعديل بنجاح'),
    ));
    getPaymentData();
    notifyListeners();
  }
}
