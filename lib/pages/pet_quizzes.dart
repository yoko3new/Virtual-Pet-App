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

  // List of questions for each pet type
  final Map<String, List<Map<String, dynamic>>> quizQuestions = {
    'cat': [
      {
        'question': 'Cats sleep for an average of 12-16 hours a day',
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
        'question': 'Cats have a specialized collarbone that allows them to always land on their feet.',
        'type': 'trueFalse',
        'answer': true,
        'options': null,
      },

      {
        'question': 'Which breed of cat is known for its lack of fur?',
        'type': 'multipleChoice',
        'answer': 'Sphynx',
        'options': ['Persian', 'Sphynx', 'Maine Coon', 'Siamese'],
      },

      {
        'question': 'Which of the following is a common characteristic of the Ragdoll cat breed?',
        'type': 'multipleChoice',
        'answer': 'They go limp when picked up',
        'options': ['They are very energetic', 'They like to stay alone', 'They go limp when picked up', 'They are very vocal'],
      },



    ],
    'dog': [
      {
        'question': 'Dogs are known to be colorblind.',
        'type': 'trueFalse',
        'answer': false,
        'options': null,
      },

      {
        'question': 'What breed is known as the "Golden Retriever"?',
        'type': 'multipleChoice',
        'answer': 'Golden Retriever',
        'options': ['Labrador', 'Golden Retriever', 'Poodle', 'Bulldog'],
      },

      {
        'question': 'Dogs sweat through their paws',
        'type': 'trueFalse',
        'answer': true,
        'options': null,
      },

      {
        'question': 'What is the oldest dog breed in the world?',
        'type': 'multipleChoice',
        'answer': 'Basenji',
        'options': ['Dachshund', 'Greyhound', 'Basenji', 'Pekingese'],
      },

      {
        'question': 'Which of the following is a dog breed that is known for its herding instincts?',
        'type': 'multipleChoice',
        'answer': 'Border Collie',
        'options': ['Boxer', 'Border Collie', 'Greyhound', 'Bulldog'],
      },
    ],
    'hamster': [
      {
        'question': 'Hamsters are nocturnal animals.',
        'type': 'trueFalse',
        'answer': true,
        'options': null,
      },

      {
        'question': 'What is the average lifespan of a hamster?',
        'type': 'multipleChoice',
        'answer': '2-3 years',
        'options': ['1-2 years', '2-3 years', '4-5 years', '6-7 years'],
      },

      {
        'question': 'Hamsters are solitary animals and should never be kept in groups.',
        'type': 'trueFalse',
        'answer': false,
        'options': null,
      },

      {
        'question': 'What do hamsters use their whiskers for?',
        'type': 'multipleChoice',
        'answer': 'To help with balance',
        'options': ['To find food', 'To help with balance', 'To detect sounds', 'To communicate with other hamsters'],
      },

      {
        'question': 'Which type of hamster is known for being the smallest?',
        'type': 'multipleChoice',
        'answer': 'Roborovski Hamster',
        'options': ['Syrian Hamster', 'Roborovski Hamster', 'Dwarf Hamster', 'Chinese Hamster'],
      },
    ],
  };

  String petType = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    petType = ModalRoute.of(context)!.settings.arguments as String;
  }

  void multipleChoice(String answer) {
    if (isQuizFinished) return;

    if (answer == quizQuestions[petType]![currentQuestion]['answer']) {
      setState(() {
        score++;
      });
    }
    nextQuestion();
  }

  void trueFalse(bool answer) {
    if (isQuizFinished) return;

    if (answer == quizQuestions[petType]![currentQuestion]['answer']) {
      setState(() {
        score++;
      });
    }
    nextQuestion();
  }

  void nextQuestion() {
    if (currentQuestion < quizQuestions[petType]!.length - 1) {
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
        title: Text('${petType} quiz'),
        backgroundColor: Colors.brown[600],
      ),
      body: isQuizFinished
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz completed! Your score is $score/${quizQuestions[petType]!.length}',
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
              quizQuestions[petType]![currentQuestion]['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),


            if (quizQuestions[petType]![currentQuestion]['type'] == 'trueFalse')
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => trueFalse(true),
                    child: const Text('True'),
                  ),
                  ElevatedButton(
                    onPressed: () => trueFalse(false),
                    child: const Text('False'),
                  ),
                ],
              )
            else if (quizQuestions[petType]![currentQuestion]['type'] == 'multipleChoice')
              Column(
                children: [
                  for (var option in quizQuestions[petType]![currentQuestion]['options']!)
                    ElevatedButton(
                      onPressed: () => multipleChoice(option),
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
