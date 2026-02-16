import 'package:flutter/foundation.dart';

/// A structured report of the JSON validation process.
class JsonValidationReport {
  final int totalKeys;
  final List<String> nullKeys;
  final List<String> validKeys;
  
  JsonValidationReport({
    required this.totalKeys,
    required this.nullKeys,
    required this.validKeys,
  });

  bool get hasNulls => nullKeys.isNotEmpty;
  double get healthPercentage => totalKeys == 0 ? 0 : (validKeys.length / totalKeys) * 100;

  @override
  String toString() => 'Total: $totalKeys | Nulls: ${nullKeys.length} | Health: ${healthPercentage.toStringAsFixed(1)}%';
}

class JsonInspector {
  /// Analyzes a JSON map for null values and returns a detailed report.
  static JsonValidationReport checkHealth(Map<String, dynamic> json) {
    final List<String> nullKeys = [];
    final List<String> validKeys = [];

    json.forEach((key, value) {
      if (value == null) {
        nullKeys.add(key);
      } else {
        validKeys.add(key);
      }
    });

    return JsonValidationReport(
      totalKeys: json.length,
      nullKeys: nullKeys,
      validKeys: validKeys,
    );
  }
}
