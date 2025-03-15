import 'package:el_sheikh/core/dependancy_injection/dependancy_injection.dart';
import 'package:el_sheikh/core/routing/app_routes.dart';
import 'package:el_sheikh/features/root/screens/chats/provider/chats_provider.dart';
import 'package:el_sheikh/features/root/screens/chats/screens/chat_screen_details.dart';
import 'package:el_sheikh/features/root/screens/chats/screens/chats_screens.dart';
import 'package:el_sheikh/features/root/screens/dashboard/screens/dashboard_screen.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/provider/interpreter_request_provider.dart';
import 'package:el_sheikh/features/root/screens/interpreter_request/screens/interpreter_request_details_screen.dart';
import 'package:el_sheikh/features/root/screens/notifications/screens/notifications_screen.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/provider/ro2ya_provider.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/screens/ro2ya_details_screen.dart';
import 'package:el_sheikh/features/root/screens/ro2ya/screens/ro2ya_screen.dart';
import 'package:el_sheikh/features/root/screens/root_screen.dart';
import 'package:el_sheikh/features/splash/screens/absher_splash_screen.dart';
import 'package:el_sheikh/features/splash/screens/quran_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => locator<InterpreterRequestProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator<ChatsProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator<Ro2yaProvider>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale('ar'),
          supportedLocales: [
            Locale('ar'),
            Locale('en'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: AppRoutes.quranSplashScreen,
          routes: {
            AppRoutes.quranSplashScreen: (context) => QuranSplashScreen(),
            AppRoutes.absherSplasheScreen: (context) => AbsherSplashScreen(),
            AppRoutes.rootScreen: (context) => RootScreen(),
            AppRoutes.ro2yaScreen: (context) => Ro2yaScreen(),
            AppRoutes.dashboardScreen: (context) => DashboardScreen(),
            AppRoutes.interpreterRequestDetailsScreen: (context) =>
                InterpreterRequestDetailsScreen(),
            AppRoutes.chatsScreen: (context) => ChatsScreens(),
            AppRoutes.chatsScreenDetails: (context) => ChatScreenDetails(),
            AppRoutes.ro2yaDetailsScreen: (context) => Ro2yaDetailsScreen(),
            AppRoutes.notificationScreen: (context) => NotificationsScreen(),
          },
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}
