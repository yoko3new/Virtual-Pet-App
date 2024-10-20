import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/components/my_textfield.dart';
import 'package:login/components/square_tile.dart';

class petSelection extends StatelessWidget {
  petSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Center the cards vertically

            children: <Widget>[
              // First Card
              Text(
                'Pet Selection',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
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

                    SquareTile(imagePath: 'lib/images/cat.png'),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Space between cards

              // Second Card
              Card(
                elevation: 20,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Dog',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 100, width: 200),
                    // Adjust height as needed
                    SquareTile(imagePath: 'lib/images/dog.png'),

                  ],
                ),
              ),
              const SizedBox(height: 20), // Space between cards

              // Third Card
              Card(
                elevation: 20,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Hamster',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 100, width: 200),
                    // Adjust height as needed
                    SquareTile(imagePath: 'lib/images/hamster.png'),

                  ],

                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Continue"),
                onPressed:(){
                  Navigator.pushNamed(context, '/petdashboard');
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}