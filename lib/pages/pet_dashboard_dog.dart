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
  int _selectedIndex = 0;

  // Track the actions for each pet activity
  bool isFeeding = false;
  bool isGrooming = false;
  bool isCuddling = false;

  @override
  void initState() {
    super.initState();
    startMoodDecrease();
  }

  // Start the timer to decrease mood every 5 secs
  void startMoodDecrease() {
    moodTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      decreaseMood();
    });
  }

  // Function to decrease mood by 5% every time the timer ticks
  void decreaseMood() {
    setState(() {
      moodLevel = (moodLevel - (moodLevel * 0.05)).clamp(0.0, 100.0);
    });
  }

  // Update mood level when user interacts
  void updateMood(double moodChange) {
    setState(() {
      moodLevel = (moodLevel + moodChange).clamp(0.0, 100.0);
    });
  }

  @override
  void dispose() {
    moodTimer.cancel();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/petchecklist');
        break;
      case 1:
        Navigator.pushNamed(context, '/milestones');
        break;
      case 2:
        Navigator.pushNamed(context, '/pet_quizzes');
        break;
      case 3:
        Navigator.pushNamed(context, '/login2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: Stack(
          children: [
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage('lib/images/bg1.png'), fit: BoxFit.cover),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text(
                    'Pet Pals',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 150),

                  // Mood status bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      children: [
                        // Mood level label
                        Text(
                          'Mood Level: ${moodLevel.toInt()}%',
                          style: TextStyle(
                            fontSize: 18,
                            color: moodLevel > 50 ? Colors.green.shade900 : Colors.red.shade900,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Mood progress bar
                        LinearProgressIndicator(
                          value: moodLevel / 100,
                          minHeight: 15,
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            moodLevel > 50 ? Colors.green : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                  // Row with buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        child: const Text("Feed pet"),
                        onPressed: () {
                          setState(() {
                            isFeeding = true;
                            isGrooming = false;
                            isCuddling = false;
                          });
                          updateMood(20);

                          // Reset to false after 3 seconds (optional)
                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              isFeeding = false;
                            });
                          });
                        },
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        child: const Text("Groom pet"),
                        onPressed: () {
                          setState(() {
                            isFeeding = false;
                            isGrooming = true;
                            isCuddling = false;
                          });
                          updateMood(20);

                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              isGrooming = false;
                            });
                          });
                        },
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        child: const Text("Cuddle pet"),
                        onPressed: () {
                          setState(() {
                            isFeeding = false;
                            isGrooming = false;
                            isCuddling = true;
                          });
                          updateMood(20);


                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              isCuddling = false;
                            });
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),


                  Container(
                    width: 300,
                    height: 300,
                    child: isFeeding
                        ? Image.asset('lib/images/dog.png', fit: BoxFit.cover) // Show feeding image
                        : isGrooming
                        ? Image.asset('lib/images/dog.png', fit: BoxFit.cover) // Show grooming image
                        : isCuddling
                        ? Image.asset('lib/images/dog.png', fit: BoxFit.cover) // Show cuddling image
                        : Image.asset('lib/images/dog.png', fit: BoxFit.cover), // Default cat image
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

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('lib/images/checklist.png', height: 30, width: 30),
            label: 'Checklist',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('lib/images/milestones.png', height: 30, width: 30),
            label: 'Milestones',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('lib/images/quizzes.png', height: 30, width: 30),
            label: 'Quizzes',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('lib/images/logout.png', height: 30, width: 30),
            label: 'Logout',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,

        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.black),
      ),

    );
  }
}

void main() {
  runApp(MaterialApp(home: petDashboardDog()));
}
