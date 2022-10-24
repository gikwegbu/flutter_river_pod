import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) => 500);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("Provider"),
      ),
      body: Center(
        child: Text("The value is $value"),
      ),
    );
  }
}
