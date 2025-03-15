import 'package:el_sheikh/features/root/screens/notifications/provider/notifications_provider.dart';
import 'package:el_sheikh/features/root/screens/chats/provider/chats_provider.dart';
import 'package:el_sheikh/features/root/screens/dashboard/provider/dashboard_provider.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/provider/interpreter_request_provider.dart';
import 'package:el_sheikh/features/root/screens/payed/provider/payed_ro2ya_provider.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/provider/ro2ya_provider.dart';
import 'package:get_it/get_it.dart';

// Create an instance of GetIt
final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<InterpreterRequestProvider>(
      () => InterpreterRequestProvider());
  locator.registerFactory<Ro2yaProvider>(() => Ro2yaProvider());
  locator.registerFactory<DashboardProvider>(() => DashboardProvider());
  locator.registerFactory<PayedRo2yaProvider>(() => PayedRo2yaProvider());
  locator.registerFactory<ChatsProvider>(() => ChatsProvider());
  locator.registerFactory<NotificationsProvider>(() => NotificationsProvider());
}
