import 'package:flutter/material.dart';
import 'package:massage/screens/Homes/home_screen.dart';
import 'package:massage/screens/Login_Regis/login_screen.dart';
import 'package:massage/screens/Login_Regis/register_screen.dart';
import 'package:massage/screens/Login_Regis/register_status.dart';
import 'package:massage/screens/Navigators/navigator.dart';
import 'package:massage/screens/Selectmasseuse/select_masseuse.dart';
import 'package:massage/screens/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Massage', home: NavigatorBar());
  }
}
