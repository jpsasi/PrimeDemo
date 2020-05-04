import 'dart:async';

import 'package:prime_demo/bloc/counter_events.dart';
import 'package:prime_demo/model/prime_counter.dart';

class PrimeCounterBloc {
  final PrimeCounter counter = PrimeCounter();

  final StreamController _counterStateController =
      StreamController<PrimeCounter>.broadcast();
  final StreamController _counterEventController =
      StreamController<CounterEvent>();

  StreamSink<PrimeCounter> get _inCounter => _counterStateController.sink;
  Stream<PrimeCounter> get counterStream => _counterStateController.stream;

  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  PrimeCounterBloc() {
    print('PrimeCounterBloc constructor');
    _counterEventController.stream.listen((event) {
      if (event is IncrementCounterEvent) {
        counter.increment();
      } else if (event is DecrementCounterEvent) {
        counter.decrement();
      } else if (event is IsThisPrimeEvent) {}
      _inCounter.add(counter);
    });
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
