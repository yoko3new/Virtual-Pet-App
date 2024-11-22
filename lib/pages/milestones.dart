import 'package:flutter/material.dart';

class petMilestones extends StatelessWidget {
  petMilestones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Title section
                Text(
                  'Milestones',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // First milestone
                _buildMilestoneCard('🔔 Your pet has turned 2 years old!'),
                const SizedBox(height: 20),

                // Second milestone
                _buildMilestoneCard('🔔 Your pet is potty trained!'),
                const SizedBox(height: 20),

                // Third milestone
                _buildMilestoneCard('🔔 Your pet made a new friend!'),
                const SizedBox(height: 20),

                // Fourth milestone
                _buildMilestoneCard('🔔 Your pet lost their first tooth!'),
                const SizedBox(height: 20),

                // Fifth milestone
                _buildMilestoneCard('🔔 Your pet has turned 1 year old!'),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMilestoneCard(String milestoneText) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Card(
        elevation: 20,
        color: Colors.white,
        child: Center(
          child: Text(
            milestoneText,
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}


