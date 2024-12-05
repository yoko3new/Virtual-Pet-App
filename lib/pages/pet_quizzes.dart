import 'package:flutter/material.dart';

class petQuizzes extends StatefulWidget {
  const petQuizzes({super.key});

  @override
  PetQuizzesState createState() => PetQuizzesState();
}

class PetQuizzesState extends State<petQuizzes> {
  int currentQuestion = 0;
  int score = 0;
  bool isQuizFinished = false;

  // List of questions
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Cats can make over 100 different sounds',
      'type': 'trueFalse',
      'answer': true,
      'options': null,
    },
    {
      'question': 'What is a group of cats called?',
      'type': 'multipleChoice',
      'answer': 'Clowder',
      'options': ['Pride', 'Pack', 'Clowder', 'Flock'],
    },
    {
      'question': 'Do cats like water?',
      'type': 'trueFalse',
      'answer': false,
      'options': null,
    },
    {
      'question': 'Which breed is known for its distinctive blue eyes?',
      'type': 'multipleChoice',
      'answer': 'Siamese',
      'options': ['Persian', 'Siamese', 'Maine Coon', 'Bengal'],
    },
    {
      'question': 'Can cats see in the dark?',
      'type': 'trueFalse',
      'answer': true,
      'options': null,
    },
  ];


  // Multiple-choice questions
  void answerMultipleChoice(String answer) {
    if (isQuizFinished) return;

    if (answer == questions[currentQuestion]['answer']) {
      setState(() {
        score++;
      });
    }

    _nextQuestion();
  }

  // True/false questions
  void answerTrueFalse(bool answer) {
    if (isQuizFinished) return;

    if (answer == questions[currentQuestion]['answer']) {
      setState(() {
        score++;
      });
    }

    _nextQuestion();
  }

  // Go to the next question
  void _nextQuestion() {
    if (currentQuestion< questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      setState(() {
        isQuizFinished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Quiz'),
        backgroundColor: Colors.brown[600],
      ),
      body: isQuizFinished
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You completed the quiz! Your score is $score/${questions.length}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  score = 0;
                  currentQuestion = 0;
                  isQuizFinished = false;
                });
              },
              child: const Text('Restart the quiz'),
            ),
          ],
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestion]['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Display question based on type
            if (questions[currentQuestion]['type'] == 'trueFalse')
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => answerTrueFalse(true),
                    child: const Text('True'),
                  ),
                  ElevatedButton(
                    onPressed: () => answerTrueFalse(false),
                    child: const Text('False'),
                  ),
                ],
              )
            else if (questions[currentQuestion]['type'] == 'multipleChoice')
              Column(
                children: [
                  for (var option in questions[currentQuestion]['options']!)
                    ElevatedButton(
                      onPressed: () => answerMultipleChoice(option),
                      child: Text(option),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
