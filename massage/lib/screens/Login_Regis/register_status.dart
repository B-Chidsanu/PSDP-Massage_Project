import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:massage/screens/Login_Regis/InputBox/button.dart';
import 'package:massage/screens/Login_Regis/masseus_register_screen.dart';
import 'package:massage/screens/Login_Regis/user_register_screen.dart';

class RegisterStatus extends StatefulWidget {
  const RegisterStatus({super.key});

  @override
  State<RegisterStatus> createState() => _RegisterStatusState();
}

class _RegisterStatusState extends State<RegisterStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
          child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  width: 180, height: 170, "assets/images/massage_logo.png"),
              Text(
                'Registation Status',
                style: GoogleFonts.chakraPetch(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                )),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.yellowAccent.shade400),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 5,
                      vertical: 30,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MasseusregisScreen()),
                  );
                },
                child: Text(
                  'SERVICE PERSON?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.redAccent.shade200),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 4,
                      vertical: 30,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserRegister()),
                  );
                },
                child: Text(
                  'SERVICE USER',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ]),
      )),
    );
  }
}
