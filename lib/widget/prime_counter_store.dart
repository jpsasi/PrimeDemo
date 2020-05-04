import 'package:flutter/material.dart';
import 'package:prime_demo/bloc/prime_counter_bloc.dart';

class PrimeCounterStore extends InheritedWidget {
  final PrimeCounterBloc primeCounterBloc;

  PrimeCounterStore(this.primeCounterBloc, {child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static PrimeCounterStore of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PrimeCounterStore>();
}
