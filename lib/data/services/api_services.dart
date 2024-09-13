import 'dart:convert';

import 'package:klontong/data/product.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'https://crudcrud.com/api/9be71464e6a34075b65b51076150b516';
  static const int pageSized = 20;

  Future<Product> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      return Product.fromJson(jsonData);
    } else {
      throw Exception('Failed to create product');
    }
  }

  Future<List<Product>> getProducts(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/products?page=$page'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data as List).map((listData) => Product.fromJson(listData)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> getProduct(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Product.fromJson(data);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> updateProduct(Product product) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${product.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update product');
    }
  }

  Future<void> deleteProduct(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }

  Future<List<Product>> searchProducts({int page = 1, String searchQuery = ''}) async {
    var url = '$baseUrl/products?page=$page&limit=$pageSized';
    if (searchQuery.isNotEmpty) {
      url += '&search=$searchQuery';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return (jsonData as List).map((jsonProduct) => Product.fromJson(jsonProduct)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
