import 'package:flutter/material.dart';
import 'package:task_manager_app/home/presentaion/home_screen.dart';

import 'auth/presentation/login_screen.dart';
import 'di/serviece_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'task_manager_app',
      routes: {
        "/" : (context) => LoginScreen(),
        "/home_screen" : (context) => HomeScreen()
      },
    );
  }
}
