import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counterScreen2_provider1.dart';
import 'provider1_baisc_roq.dart';


class CounterScreen1_Provider1 extends StatelessWidget {
 const CounterScreen1_Provider1 ({super.key});


  @override
  Widget build(BuildContext context) {
    final CounterProvider1 counter = Provider.of<CounterProvider1>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Provider Example')),
      body: Column(
        children: [
          Center(
            child: Text('Count: ${counter.count}', style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CounterScreen2_Provider1()));
          }, child: Text("Go to Page 2")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}









