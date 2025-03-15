import 'package:el_sheikh/app/my_app.dart';
import 'package:el_sheikh/core/dependancy_injection/dependancy_injection.dart';
import 'package:el_sheikh/core/notifications/local_notifications_services.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "your url",
    anonKey: "your key",
  );
  await LocalNotificationsServices.init();
  setupLocator();
  runApp(const MyApp());
}
