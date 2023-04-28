import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ButtonMasseus extends StatelessWidget {
  final String title;
  final IconData icon;

  const ButtonMasseus(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        iconColor: Colors.black,
      ),
    );
  }
}
