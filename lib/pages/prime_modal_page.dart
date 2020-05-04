import 'package:flutter/material.dart';
import 'package:prime_demo/store/counter_store.dart';
import 'package:provider/provider.dart';

class PrimeModalPage extends StatelessWidget {
  const PrimeModalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('PrimeModalPage build');
    final CounterStore counterStore = Provider.of<CounterStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Is Prime'),
      ),
      body: Container(
        child: Center(
          child: counterStore.isPrime()
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${counterStore.counter} is prime',
                        style: TextStyle(fontSize: 25.0)),
                    FlatButton(
                      child: Text(
                          counterStore.isFavoritePrime()
                              ? 'Remove from Favorites'
                              : 'Save to Favorite Primes',
                          style: TextStyle(fontSize: 25.0)),
                      onPressed: () {
                        if (counterStore.isFavoritePrime()) {
                          counterStore.removeFromFavorites();
                        } else {
                          counterStore.addToFavorites();
                        }
                      },
                    )
                  ],
                )
              : Text(
                  '${counterStore.counter} is not prime',
                  style: TextStyle(fontSize: 25.0),
                ),
        ),
      ),
    );
  }
}
