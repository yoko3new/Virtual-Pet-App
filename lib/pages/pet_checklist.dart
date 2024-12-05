import 'package:flutter/material.dart';


class petChecklist extends StatefulWidget {
  const petChecklist({super.key});

  @override
  PetChecklistState createState() => PetChecklistState();
}

class PetChecklistState extends State<petChecklist> {
  List<String> taskTitles = [
    'Feed your pet',
    'Groom your pet',
    'Play with your pet',
    'Complete a learning quiz',
    'Play a mini game',
  ];

  late List<bool> tasks;

  @override
  void initState() {
    super.initState();

    tasks = List.generate(taskTitles.length, (index) => false);

    // Debugging: Print the lengths of both lists
    print("taskTitles length: ${taskTitles.length}");
    print("tasks length: ${tasks.length}");
  }

  @override
  Widget build(BuildContext context) {
    if (taskTitles.length != tasks.length) {
      print('Error: taskTitles and tasks lists are not of the same length.');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
      ),
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                'Pet Care Checklist',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: taskTitles.length,
                  itemBuilder: (context, index) {

                    return CheckboxListTile(
                      title: Text(taskTitles[index]),
                      value: tasks[index],
                      onChanged: (bool? value) {
                        setState(() {
                          tasks[index] = value ?? false;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      tileColor: Colors.white,
                      contentPadding: const EdgeInsets.all(8.0),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
