import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/products.dart';

class ProductController extends ChangeNotifier {
  final String apiUrl = 'https://globosoft.co.uk/api_test/product_list.php';
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(apiUrl));
      

print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> productData = jsonResponse['data'];
        _products = productData.map((data) => Product.fromJson(data)).toList();

        _isLoading = false;
        notifyListeners();
      } else {
        throw Exception('Failed to load product list');
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      
      print('Error fetching products: $e');
    }
  }

  Product getProductById(int productId) {
    return _products.firstWhere((product) => product.id == productId, orElse: () => Product(id: -1, name: 'Not Found', description: '', price: 0.0, stock: 0, image: ''));
  }
}
