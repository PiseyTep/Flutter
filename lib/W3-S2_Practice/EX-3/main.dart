import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      color: Colors.grey,
      child: Column(
        children: [
          //Container1
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: 1000,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 190, 202, 235),
                Color.fromARGB(255, 170, 189, 235)
              ]),
            ),
            child: const Center(
              child: Text('OOP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  )),
            ),
          ),
          //Container2
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: 1000,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 64, 111, 241),
                Color.fromARGB(255, 112, 149, 236)
              ]),
            ),
            child: const Center(
              child: Text('DART',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  )),
            ),
          ),
          //Container3
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: 1000,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 78, 121, 240),
                Color.fromARGB(255, 11, 38, 101)
              ]),
            ),
            child: const Center(
              child: Text('FLUTTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  )),
            ),
          )
        ],
      ),
    ),
  ));
}
