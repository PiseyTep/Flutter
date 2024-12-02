import 'package:flutter/material.dart';

void main() {
  runApp(favCard());
}

class favCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue, title: const Text('Favorite cards')),
        body: const Column(
          children: [
            FavoriteCard(),
            SizedBox(
              height: 10,
            ),
            FavoriteCard(),
            SizedBox(
              height: 10,
            ),
            FavoriteCard(),
            SizedBox(
              height: 10,
            ),
            FavoriteCard(),
            SizedBox(
              height: 10,
            ),
            FavoriteCard(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text(
          'Title',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Description'),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: toggleFavorite,
        ),
      ),
    );
  }
}
