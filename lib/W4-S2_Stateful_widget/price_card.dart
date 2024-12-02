import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
            child: PriceCard(
          price: 100,
        )),
      ),
    ));

class PriceCard extends StatefulWidget {
  const PriceCard({required this.price, super.key});

  final int price;

  @override
  State<PriceCard> createState() {
    return _PriceCardState();
  }
}

class _PriceCardState extends State<PriceCard> {
  void applyDiscount() {
    setState(() {
      discountApplied = true;
    });
  }

  bool discountApplied = false;

  String get discountLabel => discountApplied ? "No discount" : " Discount!";

  num get finalPrice => discountApplied ? widget.price * 0.75 : widget.price;

  Color get backgroundColor => discountApplied ? Colors.pink : Colors.grey;

  @override
  Widget build(context) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("$finalPrice dollar"),
          Text(discountLabel),
          TextButton(
            onPressed: applyDiscount,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              ),
            ),
            child: const Text('Apply Disocunt'),
          )
        ],
      ),
    );
  }
}
