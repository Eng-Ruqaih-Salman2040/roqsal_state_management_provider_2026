import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Notifiers.dart';

void main() {
  runApp(
    MultiProvider_MyApp(),

  );
}

class MultiProvider_MyApp extends StatelessWidget {
  const MultiProvider_MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterNotifier1()),
        ChangeNotifierProvider(create: (context) => CounterNotifier2()),
        ChangeNotifierProvider(create: (context) => CounterNotifier3()),
      ],
      child:

      MaterialApp(
      home:
      //CounterPage_1(),
      CounterPage_2(),
    ));
  }
}

class CounterPage_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MultiProvider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First counter
            Consumer<CounterNotifier1>(
              builder: (context, notifier1, child) {
                return Text(
                  'Counter 1: ${notifier1.counter}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterNotifier1>().increment();
              },
              child: Text('Increment Counter 1'),
            ),
            SizedBox(height: 40),
            // Second counter
            Consumer<CounterNotifier2>(
              builder: (context, notifier2, child) {
                return Text(
                  'Counter 2: ${notifier2.counter}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterNotifier2>().decrement();
              },
              child: Text('Decrement Counter 2'),
            ),
          ],
        ),
      ),
    );
  }
}


class CounterPage_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MultiProvider Example 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First counter
            Consumer<CounterNotifier3>(
              builder: (context, notifier1, child) {
                return Text(
                  'Counter 1: ${notifier1.counter}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterNotifier3>().increment();
              },
              child: Text('Increment Counter 1'),
            ),
            SizedBox(height: 40),
            // Second counter
            Consumer<CounterNotifier3>(
              builder: (context, notifier2, child) {
                return Text(
                  'Counter 2: ${notifier2.counter}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterNotifier3>().decrement();
              },
              child: Text('Decrement Counter 2'),
            ),
          ],
        ),
      ),
    );
  }
}
