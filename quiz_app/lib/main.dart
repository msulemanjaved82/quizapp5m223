
import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';

void main() {
  runApp(MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: QuizHomePage(),
      ),
    );
  }
}


