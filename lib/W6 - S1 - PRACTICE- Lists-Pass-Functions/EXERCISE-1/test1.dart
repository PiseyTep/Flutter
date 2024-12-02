import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Myapp extends StatelessWidget {
   Myapp({super.key});
  List<String> numbers = ["Monday", "Tuesday","Wednesday", "Thursday"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          const Text("Start"),
          for (var i = 0; i < 10; i++) Text('Item $i', style: const TextStyle( fontSize: 10, ),),
          const Text("End"),
          const Text("Start"),
          ...numbers.map((item) => Text(item,style: const TextStyle(fontSize: 10),)),
          const Text("End"),
        ],
      ),
    );
  }
}

void main() {
  runApp(
     Myapp(),
  );
}
