# flavor_getter_example

This example demonstrates how to use the flavor_getter plugin in a Flutter application with multiple flavors.

## Features

- Demonstrates how to retrieve the current flavor in a Flutter app
- Shows how to set up flavors for both Android and iOS
- Includes example code for handling different flavors in your app

## Setup

### Android Setup

The example app is configured with three flavors:
- dev (with .dev suffix)
- staging (with .staging suffix)
- prod (no suffix)

The BuildConfig generation is enabled in `android/app/build.gradle`:
```groovy
android {
    buildFeatures {
        buildConfig = true
    }
}
```

### iOS Setup

The example app includes flavor configurations in Xcode for:
- dev
- staging
- prod

## Running the Example

To run the example app with different flavors:

### Android
```bash
# Run with dev flavor
flutter run --flavor dev

# Run with staging flavor
flutter run --flavor staging

# Run with prod flavor
flutter run --flavor prod
```

### iOS
```bash
# Run with dev flavor
flutter run --flavor dev

# Run with staging flavor
flutter run --flavor staging

# Run with prod flavor
flutter run --flavor prod
```

## Code Example

The main.dart file demonstrates how to use the flavor_getter plugin:

```dart
import 'package:flavor_getter/flavor_getter.dart';

void main() async {
  String currentFlavor = await FlavorGetter().getFlavor();
  print('Running in flavor: $currentFlavor');
}
```

## Additional Resources

For more information about the flavor_getter plugin, visit:
- [Plugin Documentation](https://pub.dev/packages/flavor_getter)
- [GitHub Repository](https://github.com/blvckpvblo/flavor_getter)
