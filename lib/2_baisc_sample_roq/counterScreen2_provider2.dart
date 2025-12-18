import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counterScreen1_provider2.dart';
import 'provider2_baisc_roq.dart';

class CounterScreen2_Provider2 extends StatelessWidget {
  const CounterScreen2_Provider2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 2 - Page 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider2>(
              builder: (context, counter, child) => Text(
                'Count: ${counter.counterValue}',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ActionButton(
                  icon: Icons.remove,
                  onPressed: () =>
                      context.read<CounterProvider2>().decrementNumber(),
                  color: Colors.red,
                ),
                const SizedBox(width: 20),
                _ActionButton(
                  icon: Icons.add,
                  onPressed: () =>
                      context.read<CounterProvider2>().incrementNumber(),
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterScreen1_Provider2(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Page 1'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const _ActionButton({
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: color,
        child: Icon(icon, size: 28),
      ),
    );
  }
}