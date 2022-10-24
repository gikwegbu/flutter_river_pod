import 'package:flutter/material.dart';
import 'package:flutter_river_pod/services/stream_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamValueProvider = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamValueProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("Stream Provider"),
      ),
      body: Center(
        child: streamValue.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 60,
              ),
            ),
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(child: CircularProgressIndicator(color: color)),
        ),
      ),
    );
  }
}
