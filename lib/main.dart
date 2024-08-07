// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';

// Project imports:
import 'package:hibank/home_screen.dart';
import 'package:hibank/presentation/screen/auth/auth_screen.dart';
import 'package:hibank/presentation/screen/dashboard/dashboard_screen.dart';
import 'package:hibank/util/injector/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  KiwiContainerSetUp.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        'home': (_) => const DashboardScreen(),
        'auth': (_) => const AuthScreen(),
      },
    );
  }
}
