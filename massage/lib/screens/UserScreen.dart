import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:massage/screens/Selectmasseuse/ButtonMasseus/button_masseus.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 140, vertical: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.everydayhealth.com/images/what-to-know-before-getting-a-massage-with-ankylosing-spondylitis-1440x810.jpg',
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.7,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/user.png',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'USER NAME',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 240,
                      height: 290,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonMasseus(
                              Icons.location_on,
                              'My Address   >',
                            ),
                            Underline(),
                            ButtonMasseus(Icons.group, 'Account         >'),
                            Underline(),
                            ButtonMasseus(
                                Icons.notifications, 'Notifications >'),
                            Underline(),
                            ButtonMasseus(
                                Icons.edit_square, 'Edit Profile    >'),
                            Underline(),
                            ButtonMasseus(Icons.error, 'About Me     >'),
                          ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Booking'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }
}

class Underline extends StatelessWidget {
  const Underline({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 10,
      color: Colors.grey,
      thickness: 1,
      indent: 40,
      endIndent: 40,
    );
  }
}
