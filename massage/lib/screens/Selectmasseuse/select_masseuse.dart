import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:massage/screens/Selectmasseuse/look_masseus.dart';
import 'package:massage/screens/Selectmasseuse/masseuse_button.dart';

class SelectMasseuse extends StatefulWidget {
  const SelectMasseuse({super.key});

  @override
  State<SelectMasseuse> createState() => _SelectMasseuseState();
}

class _SelectMasseuseState extends State<SelectMasseuse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              MasseuseBuuton(LookMasseus(), Color.fromARGB(255, 2, 120, 216),
                  Icons.person, 'Ms.....', '300฿', 'Emptry'),
              SizedBox(
                height: 10,
              ),
              MasseuseBuuton(LookMasseus(), Colors.redAccent.shade200,
                  Icons.person, 'Mr.....', '500฿', 'Emptry'),
            ],
          ),
        ),
      )),
    );
  }
}
