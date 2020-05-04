import 'package:flutter/material.dart';
import 'package:prime_demo/widget/prime_counter_store.dart';

class FavoritePrimesPage extends StatelessWidget {
  const FavoritePrimesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = PrimeCounterStore.of(context);
    final counter = store.primeCounterBloc.counter;
    print('FavoritePrimePage build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Primes'),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              title: Text('${counter.favoritePrimes[index]}'),
            ),
          );
        },
        itemCount: counter.favoritePrimes.length,
      ),
    );
  }
}
