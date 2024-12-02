import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrect = data['is_correct'] as bool;
            return Column(
              children: [
                // Display the Question Index (Q1, Q2, etc.)
                Row(
                  children: [
                    Text(
                      'Q${(data['question_index'] as int) + 1}',
                      style: TextStyle(
                        color: isCorrect ? Colors.green : Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        data['question'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          color:
                              Colors.black, // Set question text color to black
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Display the list of possible answers
                Column(
                  children:
                      (data['possible_answers'] as List<String>).map((answer) {
                    final isSelectedAnswer = answer == data['user_answer'];
                    final isCorrectAnswer = answer == data['correct_answer'];

                    return ListTile(
                      title: Text(
                        answer,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isCorrectAnswer
                              ? Colors.green
                              : (isSelectedAnswer
                                  ? Colors.red
                                  : Colors
                                      .black), // Use black for other answers
                        ),
                      ),
                      leading: Icon(
                        isCorrectAnswer
                            ? Icons.check
                            : isSelectedAnswer
                                ? Icons.close
                                : null,
                        color: isCorrectAnswer
                            ? Colors.green
                            : (isSelectedAnswer ? Colors.red : Colors.black),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
