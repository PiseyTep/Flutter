import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Display Colors",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 121, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            
            //Method 1
            const Label("Method 1: Loop in Array", bold: true),
            ...[
              for (var color in colors)
                Text(
                  color,
                  style: TextStyle(fontSize: 16, color: Colors.red[400]),
                ),
            ],
            //Method 2
            const Label("Method 2: Map", bold: true),
            ...colors.map((item) => Text(item, style: TextStyle(color: Colors.red[400] ),)),
            //Method 3
            const Label("Method 3: Dedicated Function", bold: true),
            ...getLabels(),
          ],
        ),
      ),
    ),
  ));
}

//function for method 3
List<Widget> getLabels() {
  return colors
      .map(
        (item) => Text(item, style: TextStyle(color: Colors.red[400]),),
      )
      .toList();
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: const Color.fromARGB(255, 2, 133, 255), fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
