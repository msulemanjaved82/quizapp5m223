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
            color: Color(0xD9D9D9),
          ),
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
                      color: Colors.black,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w400,
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
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          questions[i].question,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Center(
                        child: Text(
                          userSelectedAnswers[i] == questions[i].correctIndex
                              ? '${questions[i].options[userSelectedAnswers[i] ?? 0]}'
                              : '${questions[i].options[userSelectedAnswers[i] ?? 0]}\n${questions[i].options[questions[i].correctIndex]}',
                          style: TextStyle(
                            color: userSelectedAnswers[i] == questions[i].correctIndex
                                ? Colors.green
                                : Colors.red,
                            fontSize: 16.0,
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
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Text('$correctAnswers/$totalQuestions',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Status: $status',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 20),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Center(
                        child: Text('${timeSpentInSeconds}s / $totalTimeInSeconds',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Time:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QuizHomePage(),));
                    }, child: Text('Home'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
