import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'resultScreen.dart';
import 'questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List<Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  bool _isAnswered = false;
  late Timer _timer = Timer(Duration.zero, () {});
  int _timeInSeconds = 30;
  int _selectedOptionIndex = -1;
  int easyScore = 0;
  int totalTimeInSeconds = 300; // Assuming 5 minutes for the quiz
  int timeSpentInSeconds = 0;
  List<int?> _userSelectedAnswers = List.generate(10, (index) => null);




  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _startTimer();
  }

  Future<void> _loadQuestions() async {
    try {
      final response = await http.get(Uri.parse('assets/questions.json'));

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



  void _startTimer() {
    _timer.cancel(); // Cancel the previous timer if it exists
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    if (_timeInSeconds > 15) {
      return Colors.green;
    } else if (_timeInSeconds > 4) {
      return Colors.yellowAccent;
    } else {
      return Colors.red;
    }
  }


  void _answerQuestion(int selectedIndex) {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _selectedOptionIndex = selectedIndex;
        _userSelectedAnswers[_currentIndex] = selectedIndex;

        if (selectedIndex >= 0 &&
            _questions[_currentIndex].correctIndex == selectedIndex) {
          _score++;
        }
      });
      timeSpentInSeconds += (30 - _timeInSeconds);
      // totalTimeInSeconds += (30 - _timeInSeconds);


      Future.delayed(const Duration(seconds: 2), () {
        _nextQuestion();
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      _isAnswered = false;
      if (_currentIndex < (_questions.length - 1)) {
        // Load the next question
        _currentIndex++;
        _timeInSeconds = 30; // Reset timer for the next question
        _startTimer();
      } else {
        _timer.cancel();
        // Handle quiz completion or navigation to the result screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              totalQuestions: _questions.length,
              correctAnswers: _score, // Use _score instead of _questions._currentIndex.correctIndex
              score: 10,
              status: (easyScore > 5) ? "Pass" : (easyScore == 10) ? "Exceptional" : "Fail",
              questions: _questions,
              userSelectedAnswers: _userSelectedAnswers,
              easyScore: easyScore,
              totalTimeInSeconds: totalTimeInSeconds,
              timeSpentInSeconds: timeSpentInSeconds,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:
      Container(
        color: const Color(0xFFD9D9D9),
        child: _questions.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 24,),
              Center(
                child: Text(
                  '${_currentIndex + 1}/${_questions.length}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
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
                      offset: const Offset(0, 2), // Offset of the shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _questions[_currentIndex].question,
                    style: const TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const SizedBox(height: 42),

              Container(
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.white),
                  color: const Color(0xFFD9D9D9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.2), // Shadow color and opacity
                      spreadRadius: 2, // Spread radius of the shadow
                      blurRadius: 1, // Blur radius of the shadow
                      offset: const Offset(0, 2), // Offset of the shadow
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
                            offset: const Offset(0, 2), // Offset of the shadow
                          ),
                        ],

                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      // margin: EdgeInsets.only(left: 0.0),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: RadioListTile<int>(
                              title: Container(
                                margin: const EdgeInsets.only(left: 15.0),
                                child: Text(entry.value, style: const TextStyle(
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
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),

              const SizedBox(height: 48),
              const SizedBox(width: 198),
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
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: _updateTimerColor(),
                      ),
                      child: Center(
                        child: Text(
                          '$_timeInSeconds',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
