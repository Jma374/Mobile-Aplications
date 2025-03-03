import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int groupValue = -1; // Default unselected
  int currentQuestion = 0;
  int score = 0;
  String result = "";

  final List<String> questions = [
    'Question 1',
    'Question 2',
    'Question 3',
  ];

  final List<int> answers = [0, 0, 1];

  void checkAnswer(int answer) {
    setState(() {
      groupValue = answer;
      if (answers[currentQuestion] == answer) {
        result = "Correct!";
        score++; // Score only increases if correct
      } else {
        result = "Incorrect!";
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
        groupValue = -1; // Reset selection
        result = ""; // Reset result text
      } else {
        result = "Quiz Completed! Your score: $score/${questions.length}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100], // Light blue background
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: const Text("Quiz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Question Text
            Text(
              questions[currentQuestion],
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Answer Options
            RadioListTile(
              title: const Text("True"),
              value: 1,
              groupValue: groupValue,
              onChanged: (e) => checkAnswer(e as int),
            ),
            RadioListTile(
              title: const Text("False"),
              value: 0,
              groupValue: groupValue,
              onChanged: (e) => checkAnswer(e as int),
            ),

            const SizedBox(height: 20),

            // Correct/Incorrect Result
            Text(
              result,
              style: TextStyle(
                fontSize: 20,
                color: result == "Correct!" ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Next Button
            ElevatedButton(
              onPressed: nextQuestion,
              child: const Text("Next"),
            ),

            const Spacer(),

            // Score Display (Bottom Center)
            Text(
              "Score: $score",
              style: const TextStyle(
                fontSize: 40, // Large font size
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text for better contrast
              ),
            ),

            const SizedBox(height: 20), // Extra spacing at the bottom
          ],
        ),
      ),
    );
  }
}
