import 'package:flutter/material.dart';
import 'package:flutter_application/quiz/screens/question_screen.dart';
import 'package:flutter_application/quiz/screens/result_screen.dart';
import 'package:flutter_application/quiz/screens/welcome_screen.dart';
import 'package:flutter_application/quiz/model/quiz.dart';

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {Key? key}) : super(key: key);
  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectAnswers = [];
  String activeScreen = 'welcome_screen';

  // Widget? activeScreen; //trov brer null ber ot brer vea error bcuz yg brar vea som rab jab pderm (initailize)
  // @override
  // void initState() {
  //   //use for active screen ban nei tha do screen tv mk
  //   super.initState();
  //   activeScreen = WelcomeScreen(switchScreen);
  // }

  void switchScreen() {
    print("Switching to question screen...");
    setState(() {
      activeScreen = 'question_screen';

      // activeScreen = const QuestionScreen();// ah nis tok brer pel jg brer initState venh
    });
  }

  void chooseAnswer(String answer) {
    print("Chosen answer: $answer");
    selectAnswers.add(answer);
    if (selectAnswers.length == widget.quiz.questions.length) {
      print("All answers selected. Switching to result screen...");
      setState(() {
        activeScreen = 'result_screen';
        // 'welcome_screen'; // Go back to welcome screen when all answers are selected
      });
    }
  }
// void restartQuiz() {
//   setState(() {
//     selectAnswers.clear(); // Clear the selected answers
//     activeScreen = 'welcome_screen'; // Go back to the welcome screen
//   });
// }
//   // void handleAnswer(String selectedAnswer) {
  //   print('Selected Answer: $selectedAnswer');
  // }

  void restartQuiz() {
    setState(() {
      //selectAnswers = [];
      selectAnswers.clear();
      activeScreen = 'welcome_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        myQuestions: widget.quiz.questions,
      );
    }
    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectAnswers,
        myQuestions: widget.quiz.questions,
        onRestartQuiz: restartQuiz,
      );
    }
    // final screenWidget = activeScreen == 'welcome_screen'
    //     ? WelcomeScreen(switchScreen)
    //     : QuestionsScreen(
    //         myQuestions: widget.quiz.questions,
    //         onSelectAnswer: handleAnswer,
    //       );
    //
    // : const QuestionScreen();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        // body: const Center(
        //     // child: Column(
        //     //   mainAxisAlignment: MainAxisAlignment.center,
        //     //   children: [
        //     //     Text('TODO !'),
        //     //   ],
        //     // ),
        //     ),

        body: screenWidget,

        // body: activeScreen,//ah nis kal brer muy initState
        //  child: const WelcomeScreen(),
      ),
    );
  }
}
