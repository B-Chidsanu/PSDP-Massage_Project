import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String title;
  final String hintTitle;
  final IconData icon;
  final Color color;

  const InputBox(this.title, this.hintTitle, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          prefixIcon: Icon(icon, color: color),
          filled: true,
          fillColor: Colors.white,
          labelText: title,
          hintText: hintTitle,
          labelStyle: const TextStyle(color: Colors.purple),
        ),
      ),
    );
  }
}
