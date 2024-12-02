import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(40),
      decoration: BoxDecoration(
      color: Colors.blue[300],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[600],
        ),
        child: const Center(
            child: Text(
          "CADT STUDENTS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        )),
      ),
    ),
  ));
}
