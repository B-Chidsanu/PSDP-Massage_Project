import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:massage/screens/Search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                showlogo(),
                padded(const SearchBar()),
                button_1(),
                button_2(),
                // button_3(),
              ]),
        ),
      )),
    );
  }
}

Widget showlogo() {
  return Container(
    width: 100.0,
    height: 100.0,
    child: Image.asset('assets/images/massage_logo.png'),
  );
}

Widget padded(Widget widget) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: widget,
  );
}

Widget button_1() {
  return TextButton(
    onPressed: () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset('assets/images/1.jpg', height: 150.0),
        SizedBox(width: 10.0),
        Text('นวดแผนไทย', style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}

Widget button_2() {
  return TextButton(
    onPressed: () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset('assets/images/2.jpg', height: 150.0),
        SizedBox(width: 10.0),
        Text('นวดน้ำมัน', style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
