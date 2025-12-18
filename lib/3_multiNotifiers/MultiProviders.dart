import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Notifiers.dart';

void main() {
  runApp(const MultiProvider_MyApp());
}

class MultiProvider_MyApp extends StatelessWidget {
  const MultiProvider_MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterNotifier1()),
        ChangeNotifierProvider(create: (context) => CounterNotifier2()),
        ChangeNotifierProvider(create: (context) => CounterNotifier3()),
      ],
      child: MaterialApp(
        title: 'MultiProvider Examples',
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(),
        home: const HomePage(),
      ),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.green,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 2,
        // titleTextStyle: TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.w600,
        // ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme:  CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiProvider Examples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  _buildExampleCard(
                    context: context,
                    title: 'Example 1: Two Separate Counters',
                    subtitle: 'Counter 1 (increment) & Counter 2 (decrement)',
                    page: const CounterPage1(),
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 16),
                  _buildExampleCard(
                    context: context,
                    title: 'Example 2: Single Counter with Both Actions',
                    subtitle: 'Counter 3 (increment & decrement)',
                    page: const CounterPage2(),
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MultiProvider Examples',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Demonstrating multiple ChangeNotifiers in one app',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildExampleCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Widget page,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.layers,
                  size: 30,
                  color: color,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterPage1 extends StatelessWidget {
  const CounterPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 1: Two Separate Counters'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Counter 1 Section
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Text(
                        'Counter 1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Consumer<CounterNotifier1>(
                        builder: (context, notifier1, child) {
                          return Text(
                            '${notifier1.counter}',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<CounterNotifier1>().increment();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Increment Counter 1'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Counter 2 Section
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Text(
                        'Counter 2',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Consumer<CounterNotifier2>(
                        builder: (context, notifier2, child) {
                          return Text(
                            '${notifier2.counter}',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<CounterNotifier2>().decrement();
                        },
                        icon: const Icon(Icons.remove),
                        label: const Text('Decrement Counter 2'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildBackButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterPage2 extends StatelessWidget {
  const CounterPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 2: Single Counter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      const Text(
                        'Counter 3',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Consumer<CounterNotifier3>(
                        builder: (context, notifier3, child) {
                          return Text(
                            '${notifier3.counter}',
                            style: const TextStyle(
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 56,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                context.read<CounterNotifier3>().decrement();
                              },
                              icon: const Icon(Icons.remove, size: 24),
                              label: const Text('Decrease'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 120,
                            height: 56,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                context.read<CounterNotifier3>().increment();
                              },
                              icon: const Icon(Icons.add, size: 24),
                              label: const Text('Increase'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildBackButton(context),
              const SizedBox(height: 16),
              Text(
                'Note: Counter cannot go below 0',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBackButton(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: const Icon(Icons.arrow_back),
    label: const Text('Back to Examples'),
  );
}