import 'package:flutter/material.dart';

class achievementsPage extends StatelessWidget {
  final bool hasFedPet;
  final bool hasGroomedPet;
  final bool hasCuddledPet;

  achievementsPage({
    required this.hasFedPet,
    required this.hasGroomedPet,
    required this.hasCuddledPet,
  });

  @override
  Widget build(BuildContext context) {
    // List of achievements
    List<Achievement> achievements = [
      Achievement(
        title: "First Pet Feed",
        description: "Feed your pet for the first time.",
        icon: Icons.fastfood,
        isAchieved: hasFedPet,
      ),
      Achievement(
        title: "Groom Pet!",
        description: "Groom your pet",
        icon: Icons.cleaning_services,
        isAchieved: hasGroomedPet,
      ),
      Achievement(
        title: "Cuddles!",
        description: "Cuddle with your pet",
        icon: Icons.favorite,
        isAchieved: hasCuddledPet,
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Achievements"),
        backgroundColor: Colors.brown[600],
      ),
      body: ListView.builder(
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          var achievement = achievements[index];
          return ListTile(
            leading: Icon(
              achievement.icon,
              color: achievement.isAchieved ? Colors.green : Colors.grey,
            ),
            title: Text(achievement.title),
            subtitle: Text(achievement.description),
            trailing: Icon(
              achievement.isAchieved ? Icons.check_circle : Icons.circle_outlined,
              color: achievement.isAchieved ? Colors.green : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

class Achievement {
  final String title;
  final String description;
  final IconData icon;
  bool isAchieved;

  Achievement({
    required this.title,
    required this.description,
    required this.icon,
    this.isAchieved = false,
  });
}
