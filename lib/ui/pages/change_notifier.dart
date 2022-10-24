import 'package:flutter/material.dart';
import 'package:flutter_river_pod/models/product_model.dart';
import 'package:flutter_river_pod/ui/pages/data/cart_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key, required this.color}) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("Change Notifier Provider"),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                              'Carts: ${cartNotifier.getCarts.isNotEmpty ? cartNotifier.getCarts.length.toString() : ''}'),
                          content: SingleChildScrollView(
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                if (cartNotifier.getCarts.isNotEmpty)
                                  ...cartNotifier.getCarts.map(
                                    (item) => Text(
                                        "${item.title.toString()}: \$${item.price} "),
                                  ),
                                if (cartNotifier.getCarts.isEmpty)
                                  const Text("Empty Cart"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(),
                                Text(
                                  "Total: \$${cartNotifier.getCarts.fold<double>(0, (sum, item) => sum + item.price!.toDouble())}",
                                  // "Total: \$${productList.fold<double>(0, (sum, item) => sum + item.price!.toDouble())}",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                ref.read(cartNotifierProvider).clearCart();
                                Navigator.pop(context);
                              },
                              child: const Text('Clear'),
                            )
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.shopping_bag),
              ),
              Positioned(
                right: 0,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 16,
                    minWidth: 16,
                  ),
                  child: Text(
                    // '0',
                    cartNotifier.getCarts.length.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  title: Text(product.title.toString()),
                  subtitle: Text("\$${product.price}"),
                  trailing: IconButton(
                    onPressed: () {
                      ref
                          .read(cartNotifierProvider.notifier)
                          .addProduct(product);
                    },
                    icon: const Icon(
                      Icons.add_shopping_cart,
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
