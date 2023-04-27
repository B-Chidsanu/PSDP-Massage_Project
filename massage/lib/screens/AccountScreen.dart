import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                    Text(
                      'USER NAME',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 50,
                    ),
                  ],
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.location_on),
                        label: Text(
                          'My Address >',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          iconColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )

              // Container(
              //   child: Column(children: [
              //     TextButton.icon(
              //       onPressed: () {},
              //       icon: Icon(Icons.location_on),
              //       label: Text(
              //         'My Address',
              //         style: TextStyle(color: Colors.white, fontSize: 40),
              //       ),
              //       style: TextButton.styleFrom(
              //         minimumSize: Size.zero,
              //         padding: EdgeInsets.zero,
              //         iconColor: Colors.white,
              //       ),
              //     ),
              //   ]),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
