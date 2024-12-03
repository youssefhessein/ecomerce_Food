import 'package:flutter/material.dart';
import 'package:flutter_ecomerce2/Screens/models/productmodel.dart';


import '../Widget/ProductWidget.dart';

class Chocolate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: Product.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No products available'));
        } else {
          // تصفية المنتجات حسب الفئة "Chocolate"
          final products = Product.filterProductsByCategory(snapshot.data!, 'Chocolate');
          return GridView.builder(
            itemCount: products.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2  ), itemBuilder: (BuildContext context, int index) { return ProductWidget(product: products[index]); },
          );
        }
      },
    );
  }
}
