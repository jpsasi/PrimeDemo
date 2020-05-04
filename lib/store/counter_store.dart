import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prime_demo/service/prime_number_service.dart';

class CounterStore extends ChangeNotifier {
  final PrimeNumberService _primeNumberService = PrimeNumberService();
  int _counter = 0;
  List<int> _favoritePrimes = [];

  get counter => _counter;
  get favoritePrimes => _favoritePrimes;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  void increment() {
    counter++;
  }

  void decrement() {
    counter--;
  }

  void addToFavorites() {
    _favoritePrimes.add(_counter);
    notifyListeners();
  }

  void removeFromFavorites() {
    removeNumFromFavorites(_counter);
  }

  void removeNumFromFavorites(int num) {
    _favoritePrimes.removeWhere((value) {
      return num == value;
    });
    notifyListeners();
  }

  bool isFavoritePrime() {
    var index = _favoritePrimes.indexWhere((num) {
      return num == _counter;
    });
    return index != -1;
  }

  bool isPrime() {
    if (_counter <= 1) return false;
    if (_counter <= 3) return true;
    for (var num = 2; num < sqrt(_counter); num++) {
      if (_counter % num == 0) return false;
    }
    return true;
  }

  Future<int> nthPrime(int num) async {
    return _primeNumberService.fetchPrimes("prime $num");
  }
}
