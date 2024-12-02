import 'package:flutter/material.dart';

void main() => runApp(const btn());

class btn extends StatelessWidget {
  const btn({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: const Text(
            "Stateful widget-Button",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selection(),
              SizedBox(height: 10),
              selection(),
              SizedBox(height: 10),
              selection(),
              SizedBox(height: 10),
              selection(),
              SizedBox(height: 10),
              selection(),
              SizedBox(height: 10),
              selection(),
            ],
          ),
        ),
      ),
    );
  }
}

class selection extends StatefulWidget {
  const selection({super.key});
  @override
  State<selection> createState() => _selectionState();
}

class _selectionState extends State<selection> {
  bool isSelected = false;

  void selected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  Color get backgroundColor {
    return isSelected ? Colors.blue[500]! : Colors.blue[50]!;
  }

  Color? get textColor {
    return isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.black;
  }

  String get buttonText {
    return isSelected ? "Selected" : "Not Selected";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
              ),
              onPressed: selected,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
              ),
            )));
  }
}
