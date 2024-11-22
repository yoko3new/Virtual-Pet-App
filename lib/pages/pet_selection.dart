import 'package:flutter/material.dart';


class petSelection extends StatelessWidget {
  petSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
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

          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/petdashboard');
            },

                  child:
                  Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Cat',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Image.asset('lib/images/cat.png',
                          height: 150,
                          width: 150,
                          fit:BoxFit.fill
                      ),
                    ],
                  ),
                ),
                ),
                const SizedBox(height: 20), // Space between cards



              // Second Card

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/dogdashboard');
                },

                child:
                Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Dog',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Image.asset('lib/images/dog.png',
                          height: 150,
                          width: 150,
                          fit:BoxFit.fill
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between cards



              // Third Card

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/hamsterdashboard');
                },

                child:
                Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Hamster',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Image.asset('lib/images/hamster.png',
                          height: 150,
                          width: 150,
                          fit:BoxFit.fill
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between cards





            ],
          ),
        ),
      ),
    );
  }
}