import 'package:flutter/material.dart';
import 'ui/screens/main/main_screen.dart';

void main() => runApp(
  MaterialApp(
    home: new MainScreen(title: "Hang"),
    theme: ThemeData(fontFamily: 'RobotoMono', brightness: Brightness.light),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder> {
      //TODO:
    },
  ),
);