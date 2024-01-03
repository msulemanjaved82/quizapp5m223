import 'package:flutter/material.dart';
import 'easyQuizScreen.dart';
import 'mediumQuizScreen.dart';
import 'hardQuizScreen.dart';
import 'homeScreen.dart';

// class Button extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String buttonText;
//
//   const Button({
//     Key? key,
//     required this.onPressed,
//     required this.buttonText,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       height: 40,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             side: BorderSide(
//               color: Color.fromARGB(255, 130, 175, 196),
//               width: 2.0,
//             ),
//           ),
//           primary: Color.fromARGB(255, 132, 168, 185),
//           elevation: 5,
//           padding: EdgeInsets.all(10),
//           onPrimary: Colors.white,
//           shadowColor: Colors.black,
//         ),
//         child: Text(buttonText),
//       ),
//     );
//   }
// }

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
              Color.fromRGBO(136, 11, 213, 0),
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
              style: titleTextStyle,
            ),
            SizedBox(height: 80),
            Button(
              onPressed: () {
                Navigator.push(
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
                Navigator.push(
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
                Navigator.push(
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
