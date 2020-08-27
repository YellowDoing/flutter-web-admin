import 'package:flutter/material.dart';

Widget button(String text, VoidCallback tap) {
  return MaterialButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: tap,
      child: Text(text));
}

Widget input() {
  return Container(
    decoration: BoxDecoration(),
    child: TextField(
      onChanged: (value) {},
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    ),
  );
}
