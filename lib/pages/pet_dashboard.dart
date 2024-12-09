import 'package:flutter/material.dart';
import 'dart:async';
import 'achievements.dart';

class petDashboard extends StatefulWidget {
  const petDashboard({super.key});

  @override
  _PetDashboardState createState() => _PetDashboardState();
}

class _PetDashboardState extends State<petDashboard> {
  double moodLevel = 50.0;
  late Timer moodTimer;
  late Timer notificationTimer;
  int _selectedIndex = 0;

  // Tracking the pet moods
  bool isFeeding = false;
  bool isGrooming = false;
  bool isCuddling = false;

  String selected_pet_type = '';
  String selected_pet_image = '';

  
  // Tracking the progress for achievements
  bool hasFedPet = false;
  bool hasGroomedPet = false;
  bool hasCuddledPet = false;

  // List of pet types
  Map<String, List<String>> availableImages = {
    'cat': [
      'lib/images/cat2.png',
      'lib/images/cat3.png',
      'lib/images/cat4.png',
      'lib/images/cat5.png',
      'lib/images/cat6.png'
    ],
    'dog': [
      'lib/images/dog1.png',
      'lib/images/dog2.png',
      'lib/images/dog3.png',
      'lib/images/dog4.png',
      'lib/images/dog5.png',
      'lib/images/dog6.png'
    ],
    'hamster': [
      'lib/images/ham1.png',
      'lib/images/ham2.png',
      'lib/images/ham3.png',
      'lib/images/ham4.png',
      'lib/images/ham5.png'
    ],
  };

  // Mood bar
  void startMoodDecrease() {
    moodTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      decreaseMood();
    });
  }

  void decreaseMood() {
    setState(() {
      moodLevel = (moodLevel - (moodLevel * 0.05)).clamp(0.0, 100.0);
    });
  }

  void updateMood(double moodChange) {
    setState(() {
      moodLevel = (moodLevel + moodChange).clamp(0.0, 100.0);
    });
  }

  @override
  void dispose() {
    moodTimer.cancel();
    notificationTimer.cancel();
    super.dispose();
  }

  // Bottom nav
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
        Navigator.pushNamed(context, '/pet_quizzes', arguments: selected_pet_type);
        break;
      case 3:
        Navigator.pushNamed(context, '/loginpage');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final petType = ModalRoute.of(context)!.settings.arguments as String;

    if (petType != selected_pet_type) {
      setState(() {
        selected_pet_type = petType;
        selected_pet_image = availableImages[selected_pet_type]![0];
      });
    }

    // Pet customization card
    void selectImage() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Customize your $petType!'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ...availableImages[selected_pet_type]!.map((image) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected_pet_image = image;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 100,
                        height: 100,
                        child: Image.asset(image, fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Pet Pals'),
        backgroundColor: Colors.brown[600],
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),

      // Hamburger menu
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.brown),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('lib/images/profile.jpg'),
                  ),
                  SizedBox(height: 8),
                  Text('Hello, Jane!', style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            ListTile(
              title: Text('Pet Checklist'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/petchecklist');
              },
            ),
            ListTile(
              title: Text('Milestones'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/milestones');
              },
            ),
            ListTile(
              title: Text('Quizzes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/pet_quizzes');
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('Support'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/support');
              },
            ),
            ListTile(
              title: Text('Achievements'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => achievementsPage(
                      hasFedPet: hasFedPet,
                      hasGroomedPet: hasGroomedPet,
                      hasCuddledPet: hasCuddledPet,
                    ),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/loginpage');
              },
            ),
          ],
        ),
      ),

      // Pet dashboard screen
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('lib/images/bg1.png'), fit: BoxFit.cover),
              ),
            ),
            SingleChildScrollView(
              child: Center(
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
                    const SizedBox(height: 105),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: [
                          Text(
                            'Mood Level: ${moodLevel.toInt()}%',
                            style: TextStyle(
                              fontSize: 18,
                              color: moodLevel > 50 ? Colors.green.shade900 : Colors.red.shade900,
                            ),
                          ),
                          const SizedBox(height: 10),
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


                    // Pet mood buttons
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
                            hasFedPet = true;

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
                            hasGroomedPet = true;

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
                            updateMood(30);
                            hasCuddledPet = true;

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


                    //Pet image logic
                    GestureDetector(
                      onTap: selectImage,
                      child: Container(
                        width: 300,
                        height: 300,
                        child: isFeeding
                            ? Image.asset('lib/images/isFeeding.png', fit: BoxFit.cover)
                            : isGrooming
                            ? Image.asset('lib/images/isGrooming.png', fit: BoxFit.cover)
                            : isCuddling
                            ? Image.asset('lib/images/isCuddling.png', fit: BoxFit.cover)
                            : selected_pet_image.isNotEmpty
                            ? Image.asset(selected_pet_image, fit: BoxFit.cover)
                            : const Center(child: Text("Select an image")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation
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
  runApp(MaterialApp(home: petDashboard()));
}