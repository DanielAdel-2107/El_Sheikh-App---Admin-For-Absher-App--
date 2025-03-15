import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> addNotification(
    String userId, String title, String message) async {
  final supabase = Supabase.instance.client;

  final response = await supabase.from('notifications').insert({
    'user_id': userId,
    'title': title,
    'message': message,
    'is_read': false
  });

  if (response.error != null) {
    log('Error adding notification: ${response.error!.message}');
  }
}
