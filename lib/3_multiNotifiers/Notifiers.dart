import 'package:flutter/material.dart';

class CounterNotifier1 extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

class CounterNotifier2 extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

class CounterNotifier3 extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  void decrement() {
    _counter--;
    notifyListeners();
  }
  void increment() {
    _counter++;
    notifyListeners();
  }

}

