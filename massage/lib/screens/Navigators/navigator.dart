import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:massage/screens/UserScreen.dart';
import 'package:massage/screens/BookingScreen.dart';
import 'package:massage/screens/Homes/home_screen.dart';
import 'package:massage/screens/NotificationScreen.dart';
import 'package:massage/screens/WelcomeScreen.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int selectedIndex = 0;
  final List<Widget> pageWidget = <Widget>[
    const HomeScreen(),
    const BookingScreen(),
    const NotificationScreen(),
    const UserScreen(),
  ];
  final List<BottomNavigationBarItem> menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_outlined),
      label: 'Booking',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notification',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: 'Me',
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageWidget.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: menuBar,
        currentIndex: selectedIndex,
        selectedItemColor: Color.fromARGB(255, 254, 94, 65),
        unselectedItemColor: Color.fromARGB(255, 0, 168, 120),
        onTap: onItemTapped,
      ),
    );
  }
}
