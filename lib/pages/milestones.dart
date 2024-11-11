import 'package:flutter/material.dart';


class petMilestones extends StatelessWidget {
  petMilestones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Milestones'),
        backgroundColor: Colors.brown[300],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,


            children: <Widget>[
              // First notif
              Text(
                'Milestones',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: 400,
              child: Card(
                elevation: 20,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '🔔 Your pet has turned 2 years old!',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 24,
                      ),
                    ),
                  ],
               ),
              ),
              ),


              const SizedBox(height: 20), // Space between cards

              // Second notif
              Container(
                height: 60,
                width: 400,
                child: Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '🔔 Your pet is potty trained!',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20), // Space between cards

              // Third notif
              Container(
                height: 60,
                width: 400,
                child: Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '🔔 Your pet made a new friend!',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20), // Space between cards


              // Fourth notif
              Container(
                height: 60,
                width: 400,
                child: Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '🔔 Your pet lost their first tooth!',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20), // Space between cards

              // Fifth notif
              Container(
                height: 60,
                width: 400,
                child: Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '🔔 Your pet has turned 1 year old!',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),


              ),

            ],
          ),
        ),
      ),
    );
  }
}
