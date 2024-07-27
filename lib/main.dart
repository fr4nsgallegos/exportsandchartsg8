import 'package:exportsandchartsg8/firebase_options.dart';
import 'package:exportsandchartsg8/pages/cart_page.dart';
import 'package:exportsandchartsg8/pages/home_page.dart';
import 'package:exportsandchartsg8/pages/profile_page.dart';
import 'package:exportsandchartsg8/utils/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initMessaging();

  runApp(
    MyApp(),
    // MaterialApp(
    //   home: HomePage(),
    // ),
  );
}

final GoRouter _goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        }),
    GoRoute(
        path: '/cart',
        builder: (BuildContext context, GoRouterState state) {
          return CartPage();
        }),
    GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return ProfilePage();
        }),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _goRouter.routeInformationParser,
      routerDelegate: _goRouter.routerDelegate,
      routeInformationProvider: _goRouter.routeInformationProvider,
    );
  }
}
