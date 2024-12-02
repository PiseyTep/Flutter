import 'package:flutter/material.dart';
// import 'package:flutter_application/quiz/quiz_app.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});

//final VoidCallback startQuiz;    // use muy na kor ban dae vea krron tae jea syntax
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    // return const Text("Welcome Screen");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            "Crazy Quizz",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              onPressed: startQuiz,
              label: const Text("Start Quiz"))
        ],
      ),
    );
  }
}
