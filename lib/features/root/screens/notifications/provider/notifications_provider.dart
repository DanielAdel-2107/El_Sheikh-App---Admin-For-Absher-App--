import 'dart:developer';
import 'package:el_sheikh/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationsProvider with ChangeNotifier {
  List<NotificationModel> notifications = [];
  bool loadnotifications = false;
  static final supabase = Supabase.instance.client;

  NotificationsProvider() {
    getNotifications();
  }
  getNotifications() async {
    try {
      supabase
          .from('notifications')
          .stream(primaryKey: ['id'])
          .eq("user_id", "12345")
          .listen((value) {
            notifications =
                value.map((e) => NotificationModel.fromJson(e)).toList();
            loadnotifications = true;
            notifyListeners();
          });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
