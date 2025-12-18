import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider1_baisc_roq.dart';



class CounterScreen2_Provider1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider1>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Provider2 ')),
      body: Center(
        child: Text('Count: ${counter.count}', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}








