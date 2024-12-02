import 'package:flutter/material.dart';

enum Product {
  dart(
      title: "Dart",
      description: "the best object language",
      icon: "assets/dart.png"),
  flutter(
      title: "Flutter",
      description: "the best mobile widget library",
      icon: "assets/flutter.png"),
  firebase(
      title: "Firebase",
      description: "the best cloud database",
      icon: "assets/firebase.png");

  final String title;
  final String description;
  final String icon;

  const Product(
      {required this.title, required this.description, required this.icon});
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.icon, height: 100, width: 100),
            const SizedBox(height: 8.0),
            Text(product.title,
                style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 8.0),
            Text(product.description,
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.blue,
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductCard(product: Product.dart),
                ProductCard(product: Product.flutter),
                ProductCard(product: Product.firebase),
              ]),
        )),
  ));
}
