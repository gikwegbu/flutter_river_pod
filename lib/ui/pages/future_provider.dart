import 'package:flutter/material.dart';
import 'package:flutter_river_pod/models/suggestion_model.dart';
import 'package:flutter_river_pod/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// We basically use this for fetching data and all...

final suggestionFutureProvider =
    FutureProvider.autoDispose<Suggestion>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("Future Provider"),
      ),
      body: RefreshIndicator(
        // This won't work, based on update in riverpod doc
        // onRefresh: () => ref.refresh(suggestionFutureProvider.future),
        // This will work, as a workover...
        onRefresh: () async {
          ref.refresh(suggestionFutureProvider);
          // await ref.read(suggestionFutureProvider.future);
        },
        color: color,
        child: ListView(
          padding: const EdgeInsets.only(top: 40),
          children: [
            suggestionRef.when(
              data: (data) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data.activity.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () =>
                  Center(child: CircularProgressIndicator(color: color)),
            ),
          ],
        ),
      ),
    );
  }
}
