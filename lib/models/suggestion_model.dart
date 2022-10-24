// ignore_for_file: unnecessary_null_in_if_null_operators

class Suggestion {
  final String? activity;
  final String? type;
  Suggestion({
    this.activity,
    this.type,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        activity: json['activity'] ?? null,
        type: json['type'] ?? null,
      );
}


// https://www.boredapi.com/api/activity