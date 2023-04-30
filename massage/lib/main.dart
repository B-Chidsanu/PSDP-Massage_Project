import 'package:flutter/material.dart';
import 'package:massage/screens/Account/account_screen.dart';
import 'package:massage/screens/Login_Regis/user_register_screen.dart';
import 'package:massage/screens/Testregis.dart';
import 'package:massage/screens/UserScreen.dart';
import 'package:massage/screens/Homes/home_screen.dart';
import 'package:massage/screens/Login_Regis/login_screen.dart';
import 'package:massage/screens/Login_Regis/masseus_register_screen.dart';
import 'package:massage/screens/Login_Regis/register_status.dart';
import 'package:massage/screens/MasseusDetail.dart';
import 'package:massage/screens/Navigators/navigator.dart';
import 'package:massage/screens/Selectmasseuse/select_masseuse.dart';
import 'package:massage/screens/WelcomeScreen.dart';
import 'package:massage/screens/Navigators/navigationbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Massage', home: WelcomeScreen());
  }
}
