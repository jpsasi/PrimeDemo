import 'package:flutter/material.dart';
import 'package:prime_demo/store/counter_store.dart';
import 'package:provider/provider.dart';

class FavoritePrimesPage extends StatelessWidget {
  const FavoritePrimesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FavoritePrimePage build');
    final CounterStore counterStore = Provider.of<CounterStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Primes'),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              title: Text('${counterStore.favoritePrimes[index]}'),
            ),
          );
        },
        itemCount: counterStore.favoritePrimes.length,
      ),
    );
  }
}
