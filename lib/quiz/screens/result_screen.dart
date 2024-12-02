import 'package:flutter/material.dart';
import 'package:flutter_application/W6%20-%20S1%20-%20PRACTICE-%20Lists-Pass-Functions/EXERCISE-1/ex_1_start.dart';
import 'package:flutter_application/quiz/component/questions_summary.dart';
import 'package:flutter_application/quiz/model/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.myQuestions,
    required this.onRestartQuiz,
  });

  final List<String> chosenAnswers;
  final List<Question> myQuestions;
  final VoidCallback onRestartQuiz;

  // This method generates the summary data
  List<Map<String, Object>> getSummaryData() {
    return List.generate(chosenAnswers.length, (index) {
      return {
        'question_index': index,
        'question': myQuestions[index].title,
        'correct_answer': myQuestions[index].goodAnswer,
        'user_answer': chosenAnswers[index],
        'is_correct': chosenAnswers[index] == myQuestions[index].goodAnswer,
        'possible_answers': myQuestions[index].possibleAnswers,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numCorrectQuestions =
        summaryData.where((data) => data['is_correct'] == true).length;
    final numTotalQuestions = myQuestions.length;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display the score result (number of correct answers)
                Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // Display question summaries
                QuestionsSummary(summaryData),

                const SizedBox(height: 30),

                // Restart button to restart the quiz
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.restart_alt),
                  onPressed: onRestartQuiz,
                  label: const Text('Restart Quiz!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
