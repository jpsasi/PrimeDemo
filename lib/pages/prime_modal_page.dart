import 'package:flutter/material.dart';
import 'package:prime_demo/store/counter_store.dart';

class PrimeModalPage extends StatelessWidget {
  const PrimeModalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('PrimeModalPage build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Is Prime'),
      ),
      body: Container(),
    );
  }
}
