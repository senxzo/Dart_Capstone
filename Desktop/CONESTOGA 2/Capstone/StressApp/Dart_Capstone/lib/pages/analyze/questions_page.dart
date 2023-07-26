import 'package:flutter/material.dart';
import 'package:stressed_out/models/question.dart';
import 'package:stressed_out/utils/app_colors.dart';
import 'package:stressed_out/utils/app_constants.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<Question> questions = [
    Question(
      question: "What is the capital of France?",
      desription: "You can choose yes/no",
      options: ["London", "Paris"],
      correctAnswerIndex: 1,
    ),
    Question(
      question: "Which planet is known as the Red Planet?",
      options: ["Mars", "Venus"],
      desription: "",
      correctAnswerIndex: 0,
    ),
    Question(
      question: "What is the largest mammal?",
      desription: "You can choose yes/no",
      options: ["Elephant", "Blue Whale"],
      correctAnswerIndex: 1,
    ),
    Question(
      question: "Who wrote the play 'Romeo and Juliet'?",
      options: ["William Shakespeare", "Jane Austen"],
      desription: "You can choose yes/no",
      correctAnswerIndex: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ...List.generate(
            questions.length,
            (index) => getQuestionUI(questions[index], index),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 32.0,
            )),
            onPressed: () {
              // Selected answers are stored in the "givenAnswerIndex" property.
              print(questions[0].givenAnswerIndex.toString());
              print(questions[1].givenAnswerIndex.toString());
              print(questions[2].givenAnswerIndex.toString());
              print(questions[3].givenAnswerIndex.toString());
            },
            child: const Text(AppConstants.submit),
          ),
          const SizedBox(height: 60.0),
        ],
      ),
    );
  }

  Widget getQuestionUI(Question q, int questionNumber) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              (questionNumber + 1).toString(),
              style: TextStyle(
                color: AppColors.primarySwatch.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text(
              q.question,
              style: TextStyle(color: AppColors.primarySwatch.shade900),
            ),
            subtitle: Text(
              q.desription,
              style: TextStyle(color: AppColors.primarySwatch.shade500),
            ),
          ),
          ...List.generate(
            q.options.length,
            (optionIndex) => RadioListTile(
              title: Text(q.options[optionIndex]),
              value: optionIndex,
              groupValue: q.givenAnswerIndex,
              onChanged: (value) {
                setState(() {
                  q.givenAnswerIndex =
                      value ?? -1; // Update the selected option
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
