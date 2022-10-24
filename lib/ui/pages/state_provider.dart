import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueStateProvider = StateProvider.autoDispose<int>((ref) => 500);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueStateProvider);
    ref.listen<int>(valueStateProvider, (prev, current) {
      print("$prev -> $current");
      if (current > 520) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Hello")),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("State Provider"),
      ),
      body: Center(
        child: Text("The value is $value"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              tooltip: 'Subtract 1',
              backgroundColor: Colors.red,
              onPressed: () {
                ref.read(valueStateProvider.notifier).state--;
              },
              child: const Icon(
                Icons.remove,
                size: 30,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
              heroTag: null,
              tooltip: 'Add 1',
              backgroundColor: color,
              onPressed: () {
                ref.read(valueStateProvider.notifier).state++;
              },
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
