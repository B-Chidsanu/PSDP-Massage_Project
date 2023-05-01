import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:massage/screens/BookingScreen.dart';
import 'package:massage/screens/Homes/home_screen.dart';
import 'package:massage/screens/NotificationScreen.dart';
import 'package:massage/screens/Selectmasseuse/look_masseus.dart';
import 'package:massage/screens/Selectmasseuse/masseuse_button.dart';
import 'package:massage/screens/UserScreen.dart';

class SelectMasseuse extends StatefulWidget {
  const SelectMasseuse({super.key});

  @override
  State<SelectMasseuse> createState() => _SelectMasseuseState();
}

class _SelectMasseuseState extends State<SelectMasseuse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  width: 180, height: 170, "assets/images/massage_logo.png"),
              Container(
                width: 320,
                height: double.maxFinite,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    MasseuseBuuton(
                        LookMasseus(),
                        Color.fromARGB(255, 2, 120, 216),
                        Icons.person,
                        'Ms.....',
                        '300฿',
                        'Emptry'),
                    SizedBox(
                      height: 20,
                    ),
                    MasseuseBuuton(
                        LookMasseus(),
                        Color.fromARGB(255, 2, 120, 216),
                        Icons.person,
                        'Ms.....',
                        '300฿',
                        'Emptry'),
                    SizedBox(
                      height: 20,
                    ),
                    MasseuseBuuton(
                        LookMasseus(),
                        Color.fromARGB(255, 2, 120, 216),
                        Icons.person,
                        'Ms.....',
                        '300฿',
                        'Emptry'),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
    //   BookingScreen()
    // ][1];
  }
}
