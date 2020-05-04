import 'package:flutter/material.dart';

class FavoritePrimesPage extends StatelessWidget {
  const FavoritePrimesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FavoritePrimePage build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Primes'),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              title: Text('0'),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
