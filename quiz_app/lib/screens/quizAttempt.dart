class QuizAttempt {
  final int attemptNumber;
  final int correctAnswers;
  final int totalQuestions;
  final String status;

  QuizAttempt({
    required this.attemptNumber,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.status,
  });
}

Future<List<QuizAttempt>> fetchQuizAttempts() async {
  List<QuizAttempt> quizAttempts = [
    QuizAttempt(attemptNumber: 1, correctAnswers: 8, totalQuestions: 10, status: 'status'),
    QuizAttempt(attemptNumber: 2, correctAnswers: 6, totalQuestions: 10, status: 'Fail'),
    // Add more quiz attempts as needed
  ];

  return quizAttempts;
}
