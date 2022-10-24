import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamServiceProvider = Provider<StreamService>((ref) => StreamService());

class StreamService {
  Stream<int> getStream() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i)
        .skip(3)
        .take(10);
  }
}

// So the take, means it'll count from 0, to n-1
// So the skip, means it'll start count from n
