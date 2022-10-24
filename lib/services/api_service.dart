import 'package:dio/dio.dart';
import 'package:flutter_river_pod/models/suggestion_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String url = "https://www.boredapi.com/api/activity";

// We are using the Provider, since it's a read only, then we are returning the ApiService class we created...


final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Suggestion> getSuggestion() async {
    try {
      final res = await Dio().get(url);
      return Suggestion.fromJson(res.data);
    } catch (e) {
      throw Exception("Oops!!! Something went wrong...");
    }
  }
}
