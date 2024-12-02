import 'package:flutter/material.dart';
import 'screen/temperature.dart';
import 'screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  String currentScreen = 'welcome';

  void switchScreen() {
    setState(() {
      currentScreen = currentScreen == 'welcome' ? 'converter' : 'welcome';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff16C062),
                  Color(0xff00BCDC),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: currentScreen == 'welcome'
                ? Welcome(onPressed: switchScreen)
                : Temperature()),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
