class Question {
  String question;
  String desription;
  List<String> options;
  int correctAnswerIndex;
  int givenAnswerIndex;

  Question({
    required this.question,
    required this.desription,
    required this.options,
    required this.correctAnswerIndex,
    this.givenAnswerIndex = -1,
  });

  // Helper method to check if the given answer is correct
  bool isAnswerCorrect() {
    return givenAnswerIndex == correctAnswerIndex;
  }
}
