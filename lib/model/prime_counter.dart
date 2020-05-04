import 'dart:math';

class PrimeCounter {
  int _counter = 0;
  List<int> _favoritePrimes = [];

  int get counter => _counter;
  bool get isPrime => _isPrime();
  List<int> get favoritePrimes => _favoritePrimes;

  bool _isPrime() {
    if (_counter <= 1) return false;
    if (_counter <= 3) return true;
    for (var num = 2; num < sqrt(_counter); num++) {
      if (_counter % num == 0) return false;
    }
    return true;
  }

  void increment() {
    _counter++;
  }

  void decrement() {
    _counter--;
  }

  bool isFavoritePrime() {
    var index = _favoritePrimes.indexWhere((num) {
      return num == _counter;
    });
    return index != -1;
  }

  void addToFavorites() {
    _favoritePrimes.add(_counter);
  }

  void removeFromFavorites() {
    removeNumFromFavorites(_counter);
  }

  void removeNumFromFavorites(int num) {
    _favoritePrimes.removeWhere((value) {
      return num == value;
    });
  }
}
