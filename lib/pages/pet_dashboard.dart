import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/components/my_textfield.dart';
import 'package:login/components/square_tile.dart';

class petDashboard extends StatelessWidget {
  petDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[100],
        body: SafeArea(
        child: Center(
        child: Column(


        mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

          Text(
          'Pet Dashboard',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

            const SizedBox(height: 50),
            Card(
              elevation: 20,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Cat',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 100, width: 200),
                  // Adjust height as needed
                  SquareTile(imagePath: 'lib/images/cat.png'),
                ],
              ),
            ),

            ElevatedButton(
              child: const Text("Pet checklist"),
              onPressed:(){
                Navigator.pushNamed(context, '/');
              },
            ),

            ElevatedButton(
              child: const Text("Milestones"),
              onPressed:(){
                Navigator.pushNamed(context, '/');
              },
            ),


        ],
        ),
        ),
        ),
    );
  }
}