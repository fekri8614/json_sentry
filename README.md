# 🛡️ JSON Sentry
### Stop guessing. Know your data’s health. ###

`json_sentry` is a lightweight, zero-dependency Dart utility designed to inspect JSON payloads for structural integrity. It identifies missing values, counts keys, and provides a "Health Score" for your API responses before they hit your models and crash your Flutter app.

---

### ✨ Features
- **Null Mapping**: Instantly identify which specific keys are returning `null`.
- **Health Scoring**: Get a percentage-based reliability score for any JSON object.
- **Zero Dependencies**: Keep your pubspec.yaml clean and lean.
- **Production Ready**: Designed for error logging, analytics, and UI-level data validation.

---

### 🚀 Basic usage
Don't let a `null` value crash your party. Use `JsonSentry` to audit your data:
```dart
import 'package:json_sentry/json_sentry.dart';

void main() {
  final Map<String, dynamic> userData = {
    "id": 42,
    "name": "Aris",
    "email": null, // 🚩 The culprit
    "bio": null    // 🚩 Another one
  };

  final report = JsonInspector.checkHealth(userData);

  print('Health Score: ${report.healthPercentage}%'); 
  // Output: Health Score: 50.0%

  if (report.hasNulls) {
    print('Missing keys: ${report.nullKeys}');
  }
}
```

### 📊 The Validation Report
The `checkHealth` method returns a `JsonValidationReport` object with the following properties:


| ------------------- | -------------- | ------------------------------------------------ |
| Property            | Type           | Description                                      |
| `totalKeys`         | `int`          | The total number of keys found in the JSON.      |
| `nullKeys`          | `List<String>` | A list of keys that contain `null` values.       |
| `validKeys`         | `List<String>` | A list of keys that contain non-null values.     |
| `healthPercentage`  | `double`       | A score from 0.0 to 100.0 based on data density. |
| `hasNulls`          | `bool`         | Quick check to see if any values are missing.    |
| ------------------- | -------------- | ------------------------------------------------ |

