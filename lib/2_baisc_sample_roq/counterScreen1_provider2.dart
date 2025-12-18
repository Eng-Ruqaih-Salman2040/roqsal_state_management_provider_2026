import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../1_baisc_overview_roq/provider1_baisc_roq.dart';
import 'counterScreen2_provider2.dart';
import 'provider2_baisc_roq.dart';


class CounterScreen1_Provider2 extends StatelessWidget {
  const CounterScreen1_Provider2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider2>().CounterValue.toString(),
              style: const TextStyle(
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
                context.read<CounterProvider2>().incrementNumber();
                FocusManager.instance.primaryFocus?.unfocus();
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
                context.read<CounterProvider2>().decrementNumber();
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => CounterScreen2_Provider2()));
            }, child: Text("Back to Page 2")),
          ],
        ),
      ),
    );
  }
}



