import 'package:el_sheikh/features/root/screens/chats/screens/chats_screens.dart';
import 'package:el_sheikh/features/root/screens/dashboard/screens/dashboard_screen.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/screens/interpreter_request_screen.dart';
import 'package:el_sheikh/features/root/screens/payed/screens/payed_ro2ya_screen.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/screens/ro2ya_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  final List<Widget> screens = [
    Ro2yaScreen(),
    DashboardScreen(),
    PayedRo2yaScreen(),
    InterpreterRequestScreen(),
  ];
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
