import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentIndex = 0;
  final List<String> images = [
    'assets/w4-s2/image1.jpg',
    'assets/w4-s2/image2.jpg',
    'assets/w4-s2/image3.jpg',
  ];

  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  void previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: previousImage,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: nextImage,
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[currentIndex]),
      ),
    );
  }
}
