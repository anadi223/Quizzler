import 'package:flutter/material.dart';
import 'package:flutterapp3/quiz.dart';
import 'package:flutterapp3/splash.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  SplashScreen(),
    );
  }
}

