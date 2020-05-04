import 'package:flutter/material.dart';
import 'package:prime_demo/pages/counter_page.dart';
import 'package:prime_demo/pages/favorite_primes_page.dart';
import 'package:prime_demo/store/counter_store.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterStore>(
      create: (_) => CounterStore(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('State Management'),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Counter Demo'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CounterPage(),
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Favorite Primes'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => FavoritePrimesPage(),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
