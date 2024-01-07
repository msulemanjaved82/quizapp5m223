import 'package:flutter/material.dart';
import 'easyQuizScreen.dart';
import 'homeScreen.dart';
import 'mediumQuizScreen.dart';
import 'hardQuizScreen.dart';
import 'questions.dart';

class ResultPage extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;
  final double score;
  final String status;
  final List<Question> questions;
  final List<int?> userSelectedAnswers;
  final int easyScore;
  final int totalTimeInSeconds;
  final int timeSpentInSeconds;

  const ResultPage({
    Key? key,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.score,
    required this.status,
    required this.questions,
    required this.userSelectedAnswers,
    required this.easyScore,
    required this.totalTimeInSeconds,
    required this.timeSpentInSeconds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xBCC3C9C1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'Result',
                      style: TextStyle(
                        fontFamily: 'Itim',
                        color: Colors.blueGrey,
                        fontSize: 34.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                for (int i = 0; i < questions.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.2), // Shadow color and opacity
                          spreadRadius: 2, // Spread radius of the shadow
                          blurRadius: 1, // Blur radius of the shadow
                          offset: const Offset(0, 2), // Offset of the shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            questions[i].question,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 5.0,
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            userSelectedAnswers[i] == questions[i].correctIndex
                                ? '${questions[i].options[userSelectedAnswers[i] ?? 0]}'
                                : '${questions[i].options[userSelectedAnswers[i] ?? 0]}'
                                '\n${questions[i].options[questions[i].correctIndex]}',
                            style: TextStyle(
                              color: userSelectedAnswers[i] == questions[i].correctIndex
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 16.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.2), // Shadow color and opacity
                        spreadRadius: 2, // Spread radius of the shadow
                        blurRadius: 1, // Blur radius of the shadow
                        offset: const Offset(0, 2), // Offset of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.2), // Shadow color and opacity
                              spreadRadius: 2, // Spread radius of the shadow
                              blurRadius: 1, // Blur radius of the shadow
                              offset: const Offset(0, 2), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.white60,
                          elevation: 3.0,
                          child: Center(
                            child: Text('$correctAnswers/$totalQuestions',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Status: $status',
                          style: TextStyle(
                            fontFamily: 'Itim',
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 12),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.2), // Shadow color and opacity
                              spreadRadius: 2, // Spread radius of the shadow
                              blurRadius: 1, // Blur radius of the shadow
                              offset: const Offset(0, 2), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.white60,
                          elevation: 3.0,
                          child: Center(
                            child: Center(
                              child: Text('${timeSpentInSeconds} / $totalTimeInSeconds',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text('Time in seconds',
                          style: TextStyle(
                            fontFamily: 'Itim',
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 18),
                      Button(onPressed:  () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => QuizHomePage(),));},
                                buttonText: "Home",
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
