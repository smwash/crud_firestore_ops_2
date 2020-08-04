import 'package:crud_operations_prac2/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'editproduct.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProduct(),
                ),
              );
            },
          ),
        ],
      ),
      body: products == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: products.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  trailing: Text(
                    product.price.toString(),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProduct(product: product),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
