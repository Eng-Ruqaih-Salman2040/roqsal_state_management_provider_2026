import 'package:flutter/material.dart';

/// عداد رقم 1: يبدأ من 0 ويمكن زيادته فقط
class CounterNotifier1 extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  /// زيادة العداد بمقدار 1
  void increment() {
    _counter++;
    notifyListeners();
  }
}

/// عداد رقم 2: يبدأ من 100 ويمكن إنقاصه فقط
class CounterNotifier2 extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  /// إنقاص العداد بمقدار 1
  void decrement() {
    _counter--;
    notifyListeners();
  }
}

/// عداد رقم 3: يبدأ من 100 ويمكن زيادته وإنقاصه
class CounterNotifier3 extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  /// إنقاص العداد بمقدار 1 مع التحقق من عدم النزول عن الصفر
  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }

  /// زيادة العداد بمقدار 1
  void increment() {
    _counter++;
    notifyListeners();
  }
}