import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Button',
          ),
        ),
        body: const Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton( 	
                label: 'Submit',
                icon: Icons.check,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.primary,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.secondary,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: 'Account',
                icon: Icons.account_circle,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right, }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  Color get _buttonColor {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled ? null : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: _buttonColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: iconPosition == IconPosition.left
            ? [
                Icon(icon, color: const Color.fromARGB(255, 255, 255, 255)),
                const SizedBox(width: 300),
                Text(label, style: const TextStyle(color: Colors.white)),
              ]
            : [
                Text(label, style: const TextStyle(color: Colors.white)),
                const SizedBox(width: 300),
                Icon(icon, color: Colors.white),
              ],
      ),
    );
  }
}
