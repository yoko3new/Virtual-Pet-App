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
            children: <Widget>[
              Text(
                'Pet Selection',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),


              const SizedBox(height: 20),


              // Cat Card
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/petdashboard',
                    arguments: 'cat',
                  );
                },
                child: Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Cat',
                        style: TextStyle(fontSize: 24),
                      ),
                      Image.asset('lib/images/cat2.png', height: 150, width: 150, fit: BoxFit.fill),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20),


              // Dog Card
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/petdashboard',
                    arguments: 'dog',
                  );
                },
                child: Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Dog',
                        style: TextStyle(fontSize: 24),
                      ),
                      Image.asset('lib/images/dog1.png', height: 150, width: 150, fit: BoxFit.fill),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20),


              // Hamster Card
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/petdashboard',
                    arguments: 'hamster',
                  );
                },
                child: Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Hamster',
                        style: TextStyle(fontSize: 24),
                      ),
                      Image.asset('lib/images/ham1.png', height: 150, width: 150, fit: BoxFit.fill),
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
