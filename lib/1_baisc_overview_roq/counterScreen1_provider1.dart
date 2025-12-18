import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counterScreen2_provider1.dart';
import 'provider1_baisc_roq.dart';

class CounterScreen1_Provider1 extends StatelessWidget {
  const CounterScreen1_Provider1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example - Basic'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider1>(
              builder: (context, counter, child) => Text(
                'Count: ${counter.count}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterScreen2_Provider1(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward, size: 20),
              label: const Text('Go to Page 2'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 48),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterProvider1>().increment(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 28),
        tooltip: 'Increment counter',
      ),
    );
  }
}