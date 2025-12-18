import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider2 extends ChangeNotifier {
  int _counterValue=0;
  int get counterValue => _counterValue;
  // CounterProvider({
  //   this.counterValue = 0,
  // });

  void incrementNumber() {
    _counterValue++;
    notifyListeners();// To notify all the listeners that the value may change
  }

  void decrementNumber() {
    _counterValue--;
    notifyListeners();
  }
}