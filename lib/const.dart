import 'package:flutter/material.dart';

Color backgroundColorDark = Color(0xFF121212);
Color backgroundColor = Color(0xFF1C1C1C);
Color textColorLight = Color(0xFFE0E0E0);

InputDecoration textFieldDecoration = InputDecoration(
  labelText: 'Nome',
  labelStyle: TextStyle(
    color: Color.fromARGB(113, 224, 224, 224),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: textColorLight, width: 2),
  ),
);

TextStyle styleText = TextStyle(color: textColorLight, fontSize: 20);
