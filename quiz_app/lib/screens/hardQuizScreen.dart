import 'dart:async';
import 'dart:convert';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class hardQuizScreen extends StatefulWidget {
  @override
  _hardQuizScreenState createState() => _hardQuizScreenState();
}

class _hardQuizScreenState extends State<hardQuizScreen> {
  List<Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  bool _isAnswered = false;
  late Timer _timer = Timer(Duration.zero, () {});
  int _timeInSeconds = 8;
  int _selectedOptionIndex = -1; // Variable to store the selected option index


  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _startTimer();
  }

  Future<void> _loadQuestions() async {
    try {
      final response = await http.get(Uri.parse('assets/hard_questions.json'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<Question> shuffledQuestions = data.map((item) => Question.fromJson(item)).toList();
        shuffledQuestions.shuffle(); // Shuffle the questions
        setState(() {
          _questions = shuffledQuestions;
        });
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // ... (your existing code)

  // ... (your existing code)

  void _startTimer() {
    _timer.cancel(); // Cancel the previous timer if it exists
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeInSeconds > 0) {
        setState(() {
          _timeInSeconds--;
          _updateTimerColor();
        });
      } else {
        _timer.cancel();
        // Automatically mark as incorrect if not answered
        if (!_isAnswered) {
          _answerQuestion(-1); // Assuming -1 is an invalid index, adjust as needed
        }
        _nextQuestion();
      }
    });
  }





  Color _updateTimerColor() {
    if (_timeInSeconds >5) {
      return Colors.green;
    } else if (_timeInSeconds > 3) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }


  void _answerQuestion(int selectedIndex) {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _selectedOptionIndex = selectedIndex; // Store the selected option index
        if (selectedIndex >= 0 &&
            _questions[_currentIndex].correctIndex == selectedIndex) {
          _score++;
        }
      });

      Future.delayed(Duration(seconds: 2), () {
        _nextQuestion();
      });

    }
  }


  void _nextQuestion() {
    setState(() {
      _isAnswered = false;
       // Reset timer for the next question
      if (_currentIndex < (_questions.length-1)) {
        _currentIndex++;
        _timeInSeconds = 8;
        // Load the next question
        _startTimer();
      } else {
        _timer.cancel();
        // _showResultDialog();
      }
    });
  }

  // void _showResultDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Quiz Completed'),
  //         content: Text('Your Score: $_score'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:
      Container(
        color: Color(0xFFD9D9D9),
        child: _questions.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 24,),
              Center(
                child: Text(
                  '${_currentIndex + 1}/${_questions.length}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.2), // Shadow color and opacity
                      spreadRadius: 2, // Spread radius of the shadow
                      blurRadius: 1, // Blur radius of the shadow
                      offset: Offset(0, 2), // Offset of the shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _questions[_currentIndex].question,
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              SizedBox(height: 42),
              // ... (your existing code)

              Container(
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.white),
                  color: Color(0xFFD9D9D9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.2), // Shadow color and opacity
                      spreadRadius: 2, // Spread radius of the shadow
                      blurRadius: 1, // Blur radius of the shadow
                      offset: Offset(0, 2), // Offset of the shadow
                    ),
                  ],
                ),
                child: Column(
                  children: _questions[_currentIndex].options
                      .asMap()
                      .entries
                      .map((entry) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.2), // Shadow color and opacity
                            spreadRadius: 2, // Spread radius of the shadow
                            blurRadius: 1, // Blur radius of the shadow
                            offset: Offset(0, 2), // Offset of the shadow
                          ),
                        ],

                      ),
                      padding: EdgeInsets.symmetric(vertical: 8),
                      // margin: EdgeInsets.only(left: 0.0),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: RadioListTile<int>(
                              title: Container(
                                margin: EdgeInsets.only(left: 15.0),
                                child: Text(entry.value, style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  fontFamily: "Inter",
                                ),),
                              ),
                              value: entry.key,
                              groupValue: _isAnswered
                                  ? _selectedOptionIndex // Use the selected index
                                  : null,
                              onChanged: (value) => _answerQuestion(value!),
                              activeColor: _isAnswered ? null : Colors.green,
                              tileColor: Colors.grey,// Set to null when answered
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),

// ... (rest of your code)

              SizedBox(height: 48),
              SizedBox(width: 198),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 870,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: _updateTimerColor(),
                      ),
                      child: Center(
                        child: Text(
                          '$_timeInSeconds',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ...


            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: List<String>.from(json['options']),
      correctIndex: json['correctIndex'],
    );
  }
}
