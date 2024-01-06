import 'package:flutter/material.dart';
import 'quizAttempt.dart';
import 'homeScreen.dart';

class HistoryPage extends StatelessWidget {
  final List<QuizAttempt> quizAttempts; // Assuming you have a list of quiz attempts

  const HistoryPage({
    Key? key,
    required this.quizAttempts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Text(
              'History',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: quizAttempts.map((attempt) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                      Text(
                        '${attempt.attemptNumber}th attempt: ${attempt.status}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Text(
                          '${attempt.correctAnswers}/${attempt.totalQuestions}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10.0,
            ),
              Button(onPressed:  () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => QuizHomePage(),));},
                                buttonText: "Home",
                        ),
                         SizedBox(
              height: 20.0,
            ),
            Container(
              height: 350.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(400),
                 topRight: Radius.circular(400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}