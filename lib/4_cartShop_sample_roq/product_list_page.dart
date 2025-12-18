import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'product.dart';
import 'product_details_page.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', name: 'Apple', price: 2.0),
    Product(id: '2', name: 'Banana', price: 1.5),
    Product(id: '3', name: 'Orange', price: 1.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(product: product),
                ),
              );
            },
            trailing: ElevatedButton(
              child: Text('Add to Cart'),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addProduct(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
