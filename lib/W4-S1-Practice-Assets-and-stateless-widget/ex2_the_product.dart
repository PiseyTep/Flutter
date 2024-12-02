import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductScreen(),
    );
  }
}
enum Product {
  dart("Dart", "The best object language", "assets/ex2/dart.png"),
  flutter("Flutter", "The best mobile UI library", "assets/ex2/flutter.png"),
  firebase("Firebase", "The best cloud database", "assets/ex2/firebase.png");

  final String title;
  final String description;
  final String imagePath;

  const Product(this.title, this.description, this.imagePath);
}
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
            Image.asset(product.imagePath, height: 100),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              product.description,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 107, 154, 234),
        title: const Text("Products")),
       
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          
          children: Product.values.map((product) => ProductCard(product: product)).toList(),
        ),
      ),
    );
  }
}
// class ProductScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Products")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Image.asset('assets/ex2/dart.png', height: 100), // Example image path
//                     const SizedBox(height: 10),
//                     const Text(
//                       'Dart',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 5),
//                     const Text(
//                       'The best object language',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }