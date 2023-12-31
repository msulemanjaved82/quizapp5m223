import 'package:flutter/material.dart';
import 'package:quiz_app/screens/historyScreen.dart';
import 'package:quiz_app/screens/quizAttempt.dart';
import 'levelScreen.dart';
import 'quizAttempt.dart';
import 'historyScreen.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const Button({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(150, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: Color.fromARGB(206, 167, 165, 197),
            width: 2.0,
          ),
        ),
        primary: Color.fromARGB(206, 164, 162, 217),
        elevation: 5,
        padding: EdgeInsets.all(10),
        onPrimary: Colors.white,
        shadowColor: Colors.black,
      ),
      child: Text(buttonText, style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Itim',
        color: Colors.indigo,
      ),),
    );
  }
}

class QuizHomePage extends StatelessWidget {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelPage(),
                  ),
                );
                // Your button click logic here
              },
              buttonText: 'New Quiz' ,
            ),
            SizedBox(height: 20),
            Button(
              onPressed: () async {
                List<QuizAttempt> quizAttempts = await fetchQuizAttempts();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(
                      quizAttempts: quizAttempts,
                    ),
                  ),
                );
              },
              buttonText: 'History',
            ),
            SizedBox(height: 78.0),
            Center(
              child: Container(
                width: 470,
                child: Text(
                  'Engage in challenging quizzes, track your progress and compete with friends. Unleash Your Knowledge. Fun Learning, One Question at a Time..',
                  style: TextStyle(
                    color: Color.fromARGB(255, 92, 62, 143),
                    fontFamily: 'ComicNeue',
                     fontWeight: FontWeight.bold,
                     fontSize: 15.0,
                  ),
                ),
              ),
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
                        offset: Offset(2.0, 2.0),
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
