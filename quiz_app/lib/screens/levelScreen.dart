import 'package:flutter/material.dart';
import 'easyQuizScreen.dart';
import 'mediumQuizScreen.dart';
import 'hardQuizScreen.dart';
import 'homeScreen.dart';

class LevelPage extends StatelessWidget {
  final TextStyle titleTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
    shadows: [
      Shadow(
        blurRadius: 5.0,
        color: Colors.grey,
        offset: Offset(2.0, 2.0),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 233, 213, 238),
              Color.fromARGB(255, 199, 156, 212), // Adjusted to keep a consistent purple color
              Color.fromARGB(255, 199, 156, 212), // Adjusted to keep a consistent purple color
              Colors.black87,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Quiz Quest',
                  style: TextStyle(
                fontSize: 40,
                fontFamily: 'Italianno',
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.grey,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Button(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(),
                    ));
                // Your button click logic here
              },
              buttonText: 'Easy',
            ),
            SizedBox(height: 20),
            Button(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MediumQuizScreen(),
                    ));

                // Your button click logic here
              },
              buttonText: 'Medium',
            ),
            SizedBox(height: 20),
            Button(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => hardQuizScreen(),
                    ));
                // Your button click logic here
              },
              buttonText: 'Hard',
            ),
            SizedBox(height: 190),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: 45 * 3.141592653589793 / 180,
                  child: const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 99, 78, 103),
                    size: 100,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                Transform.rotate(
                  angle: 35 * 3.141592653589793 / 80,
                  child: Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 99, 78, 103),
                    size: 100,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(2.0, -2.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
