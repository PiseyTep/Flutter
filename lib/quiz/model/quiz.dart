class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});
}

class Question {
  final String title;
  final List<String> possibleAnswers;
  final String goodAnswer;

  static var q;

  const Question(
      {required this.title,
      required this.possibleAnswers,
      required this.goodAnswer});

  // // Method to shuffle answers randomly
  // List<String> getShuffledAnswers() {
  //   final shuffledList = List<String>.from(possibleAnswers);
  //   shuffledList.shuffle(); // Shuffle the possible answers
  //   return shuffledList; // Return the shuffled list
  // }

  List<String> getShuffledAnswers() {
    final shuffleList = List.of(possibleAnswers);
    shuffleList.shuffle();
    return shuffleList;
  }
}
