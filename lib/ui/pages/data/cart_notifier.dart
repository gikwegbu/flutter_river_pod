import 'package:flutter/material.dart';
import 'package:flutter_river_pod/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartNotifierProvider =
    ChangeNotifierProvider<CartNotifier>((ref) => CartNotifier());

class CartNotifier extends ChangeNotifier {
  final List<Product> _carts = [];

  List<Product> get getCarts => _carts;

  void addProduct(Product product) {
    _carts.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _carts.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _carts.clear();
    notifyListeners();
  }
}
