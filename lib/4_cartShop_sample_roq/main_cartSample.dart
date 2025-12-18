import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_list_page.dart';
import 'cart_provider.dart';
import 'product_list_page.dart';
import 'cart_page.dart';

void main() {
  runApp(
    CartSample_MyApp(),

  );
}

class CartSample_MyApp extends StatelessWidget {

  const CartSample_MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child:MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductListPage(),
        '/cart': (context) => CartPage(),
      },
    ));
  }
}
