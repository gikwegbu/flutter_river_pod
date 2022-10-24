import 'package:flutter_river_pod/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, List<Product>>(
        (ref) => CartStateNotifier());

class CartStateNotifier extends StateNotifier<List<Product>> {
  // The superclass 'StateNotifier<List<Product>>' doesn't have a zero argument constructor.

  // CartStateNotifier(List<Product> state) : super(state);
  CartStateNotifier() : super([]);

  void addProduct(Product product) {
    print("Adding...$product");
    // Since we can't modify the state, we use the cascading operator to add the existing state with the new product to be added
    state = [...state, product];
  }

  void removeProduct(Product product) {
    // state = state.where((element) => element.id == product.id) as List<Product>;
    state = state.where((element) => element != product).toList();
  }

  void clearCart() {
    state = [];
  }
}
