import 'package:flutter/material.dart';
import 'dart:async';

class petDashboardDog extends StatefulWidget {
  const petDashboardDog({super.key});

  @override
  _PetDashboardState createState() => _PetDashboardState();
}

class _PetDashboardState extends State<petDashboardDog> {
  double moodLevel = 50.0;
  late Timer moodTimer;

  @override
  void initState() {
    super.initState();
    _startMoodDecrease(); // Start the mood decrease timer when the app starts
  }

  // Start the timer to decrease mood every hour
  void _startMoodDecrease() {
    moodTimer = Timer.periodic(const Duration(hours: 1), (timer) {
      _decreaseMood();
    });
  }

  // Function to decrease mood by 5% every time the timer ticks
  void _decreaseMood() {
    setState(() {
      moodLevel = (moodLevel - (moodLevel * 0.05)).clamp(0.0, 100.0);
    });
  }

  // Update mood level when user interacts
  void _updateMood(double moodChange) {
    setState(() {
      moodLevel = (moodLevel + moodChange).clamp(0.0, 100.0);
    });
  }

  @override
  void dispose() {
    moodTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: Stack(
          children: [

            Center(
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
                  const SizedBox(height: 20),

                  // Mood status bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: [
                        // Mood level label
                        Text(
                          'Mood Level: ${moodLevel.toInt()}%',
                          style: TextStyle(
                            fontSize: 18,
                            color: moodLevel > 50 ? Colors.green : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Mood progress bar
                        LinearProgressIndicator(
                          value: moodLevel / 100,
                          minHeight: 15,
                          backgroundColor: Colors.grey[100],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            moodLevel > 50 ? Colors.green : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        child: const Text("Feed pet"),
                        onPressed: () {
                          _updateMood(20);
                        },
                      ),

                      SizedBox(width: 20),

                      ElevatedButton(
                        child: const Text("Groom pet"),
                        onPressed: () {
                          _updateMood(20);
                        },
                      ),

                      SizedBox(width: 20),

                      ElevatedButton(
                        child: const Text("Cuddle pet"),
                        onPressed: () {
                          _updateMood(20);
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  Card(
                    elevation: 20,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        Image.asset(
                          'lib/images/cat.png',
                          height: 200,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    child: const Text("Pet checklist"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/petchecklist');
                    },
                  ),

                  ElevatedButton(
                    child: const Text("Milestones"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/milestones');
                    },
                  ),
                ],
              ),
            ),


            // Profile pic
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'lib/images/profile.jpg',
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: petDashboardDog()));
}
