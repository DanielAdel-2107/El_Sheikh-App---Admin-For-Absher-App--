import 'dart:developer';

import 'package:el_sheikh/core/notifications/local_notifications_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Stream<List<Map<String, dynamic>>> getUnreadNotificationsStream() {
  final supabase = Supabase.instance.client;
  return supabase
      .from('notifications')
      .stream(primaryKey: ['id'])
      .eq('user_id', "12345") // شرط أول
      .map(
        (data) {
          final notifications = List<Map<String, dynamic>>.from(data);
          // فلترة إضافية باستخدام where
          return notifications.where((notification) {
            return notification['is_read'] == false;
          }).toList();
        },
      );
}

void handleUnreadNotificationsStream() {
  final unreadNotificationsStream = getUnreadNotificationsStream();
  int notificationIdCounter = 0;
  unreadNotificationsStream.listen((notifications) async {
    for (var notification in notifications) {
      try {
        LocalNotificationsServices.showBasicNotification(
          body: notification['message'],
          title: notification['title'],
          id: notificationIdCounter,
        );
        notificationIdCounter++;
        await markAsRead(notification['id']);
      } catch (e) {
        log('Error handling notification: $e');
      }
    }
  });
}

Future<void> markAsRead(String notificationId) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase
        .from('notifications')
        .update({'is_read': true}).eq('id', notificationId);

    if (response.error != null) {
      log('Error marking notification as read: ${response.error!.message}');
    } else {
      log('Notification marked as read');
    }
  } catch (e) {
    log('Exception occurred while marking as read: $e');
  }
}
