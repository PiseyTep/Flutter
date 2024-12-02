import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      color: Colors.grey,
      child: const Column(
        children: [
          CustomCard(text: "OOP", color: Color.fromARGB(255, 10, 71, 240)),
          CustomCard(text: "DART", color: Color.fromARGB(255, 64, 111, 241)),
          CustomCard(text: "FLUTTER", color: Color.fromARGB(255, 15, 36, 93)),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;

  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
  });

  @override
 
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      width: 1000,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
       child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
