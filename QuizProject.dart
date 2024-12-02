import 'dart:io';

class Quiz {
  List<Question> questions = [];
  List<Participant> participants = [];

  void addQuestion(Question q) {
    questions.add(q);
  }

  void addParticipant(Participant p) {
    participants.add(p);
  }

  void calculateResults(Participant participant) {
    int score = 0;
    for (var i = 0; i < questions.length; i++) {
      bool isCorrect = questions[i].validateAnswer(participant.answers[i]);
      if (isCorrect) {
        score++;
      }
      participant.recordAnswerResult(questions[i], participant.answers[i], isCorrect);
    }
    participant.recordScore(score);
    _recordResult(participant);
  }

  // Private method to display the result of a participant
  void _recordResult(Participant participant) {
    print('\nResult for ${participant.firstName} ${participant.lastName}:');
    for (var result in participant.answerResults) {
      print('Question: ${result['question'].title}');
      print('Your Answer: ${result['answer']}');
      if (result['isCorrect']) {
        print('Correct!');
      } else {
        print('Incorrect. The correct answer is: ${result['question'].correctAnswer()}');
      }
      print('');
    }
    print('Total Score: ${participant.score} points');
  }

  // Displays the overall quiz results for all participants
  void displayResults() {
    print("\nQuiz Results:");
    for (var participant in participants) {
      print('${participant.firstName} ${participant.lastName} scored: ${participant.score}');
    }
  }
}

abstract class Question {
  String title;
  List<String> options;

  Question(this.title, this.options);

  bool validateAnswer(String answer);

  // Abstract method to retrieve the correct answer(s)
  String correctAnswer();
}

class SingleChoice extends Question {
  String correctAnswerText;

  SingleChoice(String title, List<String> options, this.correctAnswerText) : super(title, options);

  @override
  bool validateAnswer(String answer) {
    return answer.toLowerCase() == correctAnswerText.toLowerCase();
  }

  @override
  String correctAnswer() {
    return correctAnswerText;
  }
}

class MultipleChoice extends Question {
  List<String> correctAnswers;

  MultipleChoice(String title, List<String> options, this.correctAnswers) : super(title, options);

  @override
  bool validateAnswer(String answer) {
    List<String> answers = answer
        .split(',')
        .map((e) => e.trim().toLowerCase())
        .toList();
    return answers.toSet().containsAll(correctAnswers.map((e) => e.toLowerCase())) &&
        correctAnswers.map((e) => e.toLowerCase()).toSet().containsAll(answers);
  }

  @override
  String correctAnswer() {
    return correctAnswers.join(', ');
  }
}

class Participant {
  String firstName;
  String lastName;
  int score = 0;
  List<String> answers = [];
  List<Map<String, dynamic>> answerResults = [];

  Participant(this.firstName, this.lastName);

  void recordScore(int score) {
    this.score = score;
  }

  void setAnswers(List<String> answers) {
    this.answers = answers;
  }

  void recordAnswerResult(Question question, String answer, bool isCorrect) {
    answerResults.add({
      'question': question,
      'answer': answer,
      'isCorrect': isCorrect,
    });
  }
}

void main() {
  var quiz = Quiz();

  // Adding questions to the quiz
  var question1 = SingleChoice(" 1. What is Flutter primarily used for?", 
    ["A) Web development", "B) Mobile application development", "C) Desktop application development", "D) All of above"], "D");
  var question2 = SingleChoice("2. Which of the following is a fundamental building block of a Flutter app?", 
    ["A) Component", "B) Widget ", "C) Package", "D) Module"], "B");
  var question3 = SingleChoice("3. Which widget should be used when you need to rebuild the UI in response to user interactions, such as clicking a button?", 
    ["A) StatelessWidget", "B) StatefulWidget ", "C) Container", "D) RaisedButton"], "B");
  var question4 = MultipleChoice("4. Which of the following methods are used to handle user input in Flutter?", 
    ["A) onPressed", "B) onChanged", "C) onTap", "D) onSubmit"], ["A", "B", "C"]);
  var question5 = MultipleChoice("5. Which of the following are considered stateless elements in Flutter?", 
    ["A) Text widget", "B) Icon widget", "C) TextField widget", "D) FlatButton widget"], ["A", "B"]);

  quiz.addQuestion(question1);
  quiz.addQuestion(question2);
  quiz.addQuestion(question3);
  quiz.addQuestion(question4);
  quiz.addQuestion(question5);

  while (true) {
    print("\nMenu:");
    print("1. Add a participant");
    print("2. Display overall results");
    print("3. Exit");

    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      // Add a new participant
      stdout.write("Enter first name: ");
      String firstName = stdin.readLineSync()!;

      stdout.write("Enter last name: ");
      String lastName = stdin.readLineSync()!;

      var participant = Participant(firstName, lastName);

      List<String> answers = [];
      for (var question in quiz.questions) {
        if (question is SingleChoice) {
          print('\nSingle choice (Ex: A or a)\n');
        } else if (question is MultipleChoice) {
          print('\nMultiple choice (Ex: A,B or a,b)\n');
        }

        print("\n${question.title}");
        for (var option in question.options) {
          print(" $option");
        }

        stdout.write("Enter your answer: ");
        String answer = stdin.readLineSync()!;
        answers.add(answer);
      }

      participant.setAnswers(answers);
      quiz.addParticipant(participant);
      quiz.calculateResults(participant);
    } else if (choice == "2") {
      quiz.displayResults();
    } else if (choice == "3") {
      print("Exiting quiz...");
      break;
    } else {
      print("Invalid choice. Please try again.");
    }
  }
}
