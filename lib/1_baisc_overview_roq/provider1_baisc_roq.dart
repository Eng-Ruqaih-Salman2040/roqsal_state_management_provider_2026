import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CounterProvider1 with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

