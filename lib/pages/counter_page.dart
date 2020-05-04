import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prime_demo/pages/prime_modal_page.dart';
import 'package:prime_demo/store/counter_store.dart';
import 'package:provider/provider.dart';
import 'package:humanize/humanize.dart' as humanize;

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CounterPage build');
    final CounterStore counterStore =
        Provider.of<CounterStore>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Icon(Icons.remove),
                    onPressed: () {
                      counterStore.decrement();
                    },
                  ),
                  Consumer<CounterStore>(
                    builder: (context, counterStore, child) {
                      return Text("${counterStore.counter}",
                          style: TextStyle(fontSize: 40.0));
                    },
                  ),
                  FlatButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      counterStore.increment();
                    },
                  )
                ],
              ),
              FlatButton(
                child: Text(
                  'Is this prime?',
                  style: TextStyle(fontSize: 25.0),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => PrimeModalPage(),
                  ));
                },
              ),
              FlatButton(
                child: Consumer<CounterStore>(
                  builder: (context, counterStore, child) {
                    return Text(
                        'What is ${humanize.ordinal(counterStore.counter)} prime',
                        style: TextStyle(fontSize: 25.0));
                  },
                ),
                onPressed: () {
                  counterStore.nthPrime(counterStore.counter).then(
                    (value) {
                      if (Platform.isIOS) {
                        showCupertinoDialog(
                            context: context,
                            builder: (_) {
                              return CupertinoAlertDialog(
                                title: Text('Nth Prime Value'),
                                content: Text(
                                    '${counterStore.counter}th prime value is $value'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Nth Prime Value'),
                              content: Text(
                                  '${counterStore.counter}th prime value is $value'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
