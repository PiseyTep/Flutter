import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';
import 'screens/welcome_screen.dart';
import 'screens/result_screen.dart';

void main() {
  final List<Question> myQuestions = [
    // Question q1 =
    const Question(
        title: "Who is the best teacher?",
        possibleAnswers: ["ronan", "hongly", 'leangsiv'],
        goodAnswer: 'ronan'),

    // Question q2 =
    const Question(
        title: "Which color is the best?",
        possibleAnswers: ["blue", "red", 'green'],
        goodAnswer: 'red')
  ];
  //List<Question> myQuestions = [q1, q2];
  //Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);
  final Quiz myQuiz = Quiz(title: "Crazy Quiz", questions: myQuestions);
  runApp(QuizApp(myQuiz));
}
