import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const HobbyCard(
      {super.key,
      required this.title,
      required this.icon,
      this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          )
        ],
      ),
    );
  }
}

class HobbiesScreen extends StatelessWidget {
  const HobbiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: const Color.fromARGB(255, 226, 72, 190),
        leadingWidth: 100,
        toolbarHeight: 100,
        title: const Text("My Hobbies",
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HobbyCard(
                title: "Traveling",
                icon: Icons.travel_explore_rounded,
                color: Colors.green),
            HobbyCard(
                title: "Skating",
                icon: Icons.snowboarding_rounded,
                color: Color.fromARGB(255, 44, 60, 128)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HobbiesScreen(),
  ));
}
