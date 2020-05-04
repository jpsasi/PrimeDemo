import 'package:flutter/material.dart';
import 'package:prime_demo/model/prime_counter.dart';
import 'package:prime_demo/widget/prime_counter_store.dart';

class PrimeModalPage extends StatefulWidget {
  const PrimeModalPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrimeModalState();
}

class _PrimeModalState extends State<PrimeModalPage> {
  @override
  Widget build(BuildContext context) {
    final store = PrimeCounterStore.of(context);
    final counter = store.primeCounterBloc.counter;

    print('PrimeModalPage build $store');
    return Scaffold(
      appBar: AppBar(
        title: Text('Is Prime'),
      ),
      body: Container(
        child: StreamBuilder<PrimeCounter>(
            stream: store.primeCounterBloc.counterStream,
            builder: (context, snapshot) {
              return Center(
                child: counter.isPrime
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            snapshot.data != null
                                ? '${snapshot.data.counter} is a Prime'
                                : '${counter.counter} is a Prime',
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          FlatButton(
                            child: counter.isFavoritePrime()
                                ? Text(
                                    'Remove from Favoites',
                                    style: TextStyle(fontSize: 25.0),
                                  )
                                : Text('Save to Favorites',
                                    style: TextStyle(fontSize: 25.0)),
                            onPressed: () {
                              if (counter.isFavoritePrime()) {
                                setState(() {
                                  counter.removeFromFavorites();
                                });
                              } else {
                                setState(() {
                                  counter.addToFavorites();
                                });
                              }

                              // if (snapshot.data != null) {
                              //   if (snapshot.data.isFavoritePrime()) {
                              //     snapshot.data.removeFromFavorites();
                              //   } else {
                              //     snapshot.data.addToFavorites();
                              //   }
                              // } else {
                              //   if (counter.isFavoritePrime()) {
                              //     counter.removeFromFavorites();
                              //   } else {
                              //     counter.addToFavorites();
                              //   }
                              // }
                            },
                          )
                        ],
                      )
                    : Text('${counter.counter} is not a Prime'),
              );
            }),
      ),
    );
  }
}
