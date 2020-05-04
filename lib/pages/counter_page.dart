import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prime_demo/bloc/counter_events.dart';
import 'package:prime_demo/model/prime_counter.dart';
import 'package:prime_demo/pages/prime_modal_page.dart';
import 'package:prime_demo/widget/prime_counter_store.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = PrimeCounterStore.of(context);
    print('CounterPage build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder<PrimeCounter>(
              stream: store.primeCounterBloc.counterStream,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildCounterWidget(store, snapshot),
                    buildIsPrimeWidget(context),
                    buildNthPrimeWidget(snapshot)
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget buildNthPrimeWidget(AsyncSnapshot<PrimeCounter> snapshot) {
    return FlatButton(
      child: Text(
          snapshot.data != null
              ? 'What is ${snapshot.data.counter}th prime'
              : 'What is 0th prime',
          style: TextStyle(fontSize: 25.0)),
      onPressed: () {},
    );
  }

  Widget buildIsPrimeWidget(BuildContext context) {
    return FlatButton(
      child: Text(
        'Is this prime?',
        style: TextStyle(fontSize: 25.0),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => PrimeModalPage(),
        ));
      },
    );
  }

  Widget buildCounterWidget(
      PrimeCounterStore store, AsyncSnapshot<PrimeCounter> snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Icon(Icons.remove),
          onPressed: () {
            store.primeCounterBloc.counterEventSink
                .add(DecrementCounterEvent());
          },
        ),
        Text(
          snapshot.data != null ? '${snapshot.data.counter}' : '0',
          style: TextStyle(fontSize: 30.0),
        ),
        FlatButton(
          child: Icon(Icons.add),
          onPressed: () {
            store.primeCounterBloc.counterEventSink
                .add(IncrementCounterEvent());
          },
        )
      ],
    );
  }
}
