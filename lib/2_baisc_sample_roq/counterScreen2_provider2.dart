import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../1_baisc_overview_roq/provider1_baisc_roq.dart';
import 'counterScreen1_provider2.dart';
import 'provider2_baisc_roq.dart';



class CounterScreen2_Provider2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider2>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Provider2 ')),
      body: Center(
        child: Column(
          children: [
            Text('Count: ${counter.CounterValue}', style: const TextStyle(
              color: Colors.green,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                counter.incrementNumber;
                context.read<CounterProvider2>().incrementNumber();
                //FocusManager.instance.primaryFocus?.unfocus();
              },
              child: const Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
               // context.read<CounterProvider>().decrementNumber();
                counter.decrementNumber;
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: const Text(
                '-',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CounterScreen1_Provider2()));
            }, child: Text("Back to Page 2")),
          ],
        ),
      ),

    );
  }
}


