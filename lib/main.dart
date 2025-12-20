

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '1_baisc_overview_roq/counterScreen1_provider1.dart';
import '1_baisc_overview_roq/provider1_baisc_roq.dart';
import '2_baisc_sample_roq/counterScreen1_provider2.dart';
import '2_baisc_sample_roq/provider2_baisc_roq.dart';
import '3_multiNotifiers/MultiProviders.dart';
import '4_cartShop_sample_roq/main_cartSample.dart';

// ... الواردات الأخرى

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider1()),
        ChangeNotifierProvider(create: (context) => CounterProvider2()),
      ],
      child: MaterialApp(
        title: 'Provider Examples',
        theme: _buildTheme(),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          '/basic-overview': (context) => const CounterScreen1_Provider1(),
          '/basic-sample': (context) => const CounterScreen1_Provider2(),
          '/multi-provider': (context) => const MultiProvider_MyApp(),
          '/cart-sample': (context) => const CartSample_MyApp(),
        },
      ),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Tajawal', // للدعم العربي
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 2,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }


// ... باقي الكود
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Examples'),
      ),
      body: SafeArea( // ← إضافة SafeArea
        child: Padding(
          padding: const EdgeInsets.all(16.0), // ← تقليل الحواف
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 20), // ← تقليل المسافة
              Expanded( // ← حل المشكلة الرئيسي: استخدام Expanded
                child: _buildExampleGrid(),
              ),
              const SizedBox(height: 16),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Provider Examples',
          style: TextStyle(
            fontSize: 24, // ← تقليل حجم الخط
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Select an example to see Provider in action',
          style: TextStyle(
            fontSize: 14, // ← تقليل حجم الخط
            color: Colors.grey[900],
          ),
        ),
      ],
    );
  }

  Widget _buildExampleGrid() {
    const examples = [
      {
        'title': 'Basic Overview',
        'subtitle': 'Introduction to Provider',
        'route': '/basic-overview',
        'icon': Icons.info,
        'color': Colors.blue,
      },
      {
        'title': 'Basic Sample',
        'subtitle': 'Simple Provider example',
        'route': '/basic-sample',
        'icon': Icons.code,
        'color': Colors.green,
      },
      {
        'title': 'MultiProvider',
        'subtitle': 'Multiple Providers',
        'route': '/multi-provider',
        'icon': Icons.layers,
        'color': Colors.orange,
      },
      {
        'title': 'Shop Cart',
        'subtitle': 'Shopping cart example',
        'route': '/cart-sample',
        'icon': Icons.shopping_cart,
        'color': Colors.purple,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9, // ← تعديل النسبة لتكون أقل
      ),
      itemCount: examples.length,
      itemBuilder: (context, index) {
        final example = examples[index];
        return _buildExampleCard(
          title: example['title'] as String,
          subtitle: example['subtitle'] as String,
          route: example['route'] as String,
          icon: example['icon'] as IconData,
          color: example['color'] as Color,
          context: context,
        );
      },
    );
  }

  Widget _buildExampleCard({
    required String title,
    required String subtitle,
    required String route,
    required IconData icon,
    required Color color,
    context,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0), // ← تقليل الحواف الداخلية
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Divider(height: 20),
        Text(
          'Provider State Management in Flutter (^_^)\n By Eng: Ruqaih Hussein Salman',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[900],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
