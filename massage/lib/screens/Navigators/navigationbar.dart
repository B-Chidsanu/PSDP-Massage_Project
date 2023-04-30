import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:massage/screens/BookingScreen.dart';
import 'package:massage/screens/Homes/home_screen.dart';
import 'package:massage/screens/NotificationScreen.dart';
import 'package:massage/screens/UserScreen.dart';

class NavigaBar extends StatefulWidget {
  const NavigaBar({super.key});

  @override
  State<NavigaBar> createState() => _NavigaBarState();
}

class _NavigaBarState extends State<NavigaBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const BookingScreen(),
    const NotificationScreen(),
    const UserScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 254, 94, 65),
        unselectedItemColor: Color.fromARGB(255, 0, 168, 120),
        onTap: _onItemTapped,
      ),
    );
  }
}
