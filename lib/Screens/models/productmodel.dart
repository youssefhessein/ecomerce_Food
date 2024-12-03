import 'dart:convert';
import 'package:flutter/services.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double oldPrice;
  final String image;
  final String category;
  int quantity ;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.category,
    required this.image,
     this.quantity = 1 ,
  });  // Override operator ==
  // Override operator ==
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Product && other.id == id);

  // Override hashCode
  @override
  int get hashCode => id.hashCode;
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      oldPrice: (json['oldPrice'] as num).toDouble(),
      category: json['category'],
      image: json['image'],
    );
  }

  static Future<List<Product>> fetchProducts() async {
    final jsonString = await rootBundle.loadString('assets/Product.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => Product.fromJson(json)).toList();
  }

  static List<Product> filterProductsByCategory(List<Product> products, String category) {
    return products.where((product) => product.category == category).toList();
  }
}




// import 'dart:convert';
// import 'package:flutter/services.dart';
//
// class Product {
//   final int id;
//   final String name;
//   final String description;
//   final double price;
//   final double oldPrice;
//   final String image;
//   final String category;
//
//   Product({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.oldPrice,
//     required this.category,
//     required this.image,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       price: (json['price'] as num).toDouble(), // تعديل هنا
//       oldPrice: (json['oldPrice'] as num).toDouble(), // تعديل هنا
//       category: json['category'],
//       image: json['image'],
//     );
//   }
//
//   Future<List<Product>> fetchProducts() async {
//     final jsonString = await rootBundle.loadString('assets/Product.json');
//     final List<dynamic> jsonData = json.decode(jsonString);
//     return jsonData.map((json) => Product.fromJson(json)).toList();
//   }
//
//   List<Product> parseProducts(List<Map<String, dynamic>> jsonList) {
//     return jsonList.map((json) => Product.fromJson(json)).toList();
//   }
//
//   Map<String, List<Product>> categorizeProducts(List<Product> products) {
//     Map<String, List<Product>> categorizedProducts = {};
//
//     for (var product in products) {
//       if (categorizedProducts[product.category] == null) {
//         categorizedProducts[product.category] = [];
//       }
//       categorizedProducts[product.category]?.add(product);
//     }
//     return categorizedProducts;
//   }
//
//   List<Product> filterProductsByCategory(List<Product> products, String category) {
//     return products.where((product) => product.category == category).toList();
//   }
// }
