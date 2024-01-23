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
        color: Color(0x80C4A9EF),
        child: Column(
          children: [
            Text(
              'History',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Itim',
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Column(
              children: quizAttempts.map((attempt) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.2), // Shadow color and opacity
                          spreadRadius: 2, // Spread radius of the shadow
                          blurRadius: 1, // Blur radius of the shadow
                          offset: const Offset(0, 2), // Offset of the shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),

                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '${attempt.attemptNumber} attempt: ${attempt.status}',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 790,
                        ),
                        Container(
                          width: 50,
                          height: 50,
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
                              child: Text(
                               '${attempt.correctAnswers}/${attempt.totalQuestions}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            // '${attempt.correctAnswers}/${attempt.totalQuestions}',
            //
            SizedBox(
              height: 20.0,
            ),
              Button(onPressed:  () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => QuizHomePage(),));},
                                buttonText: "Home",
                        ),
            //              SizedBox(
            //   height: 10.0,
            // ),
            Container(
              // color: Colors.blue,
              child: Center(
                child: Icon(
                  Icons.circle,
                  color: Color.fromARGB(255, 187, 184, 199),
                  size: 1500,),
              ),
              height: 350,
              width: double.infinity,
              // decoration: BoxDecoration(
              //   color: Color(0x80C0B6E1),
              //   borderRadius: BorderRadius.vertical(
              //    top: Radius.circular(500),
              //    // topRight: Radius.circular(850),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}