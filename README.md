# Flavor Getter

[![pub package](https://img.shields.io/pub/v/flavor_getter.svg)](https://pub.dev/packages/flavor_getter)

Flavor Getter is a Flutter plugin that helps developers retrieve the current flavor (or variant) their application is running in directly from their Flutter code. This plugin currently supports iOS and Android platforms.

## Installation

To use the Flavor Getter plugin in your Flutter project, follow these steps:

1. Add the following dependency to your project's `pubspec.yaml` file:
```yaml
dependencies:
  flavor_getter: ^1.0.0
```
Replace `^1.0.0` with the desired version of the Flavor Getter plugin.

2. Run the following command to fetch the dependencies:
```bash
flutter pub get
```

3. Import the Flavor Getter package in your Dart code:
```dart
import 'package:flavor_getter/flavor_getter.dart';
```

## Getting Started

To use Flavor Getter in your Flutter project, you need to perform some setup steps depending on the platform you are targeting.

## Platform Support

| Platform | Support |
| -------- | ------- |
| iOS      | ✅      |
| Android  | ✅      |

## Disclaimer

Please note that this readme assumes that you have already set up the flavors (or variants) for your iOS and Android projects. The instructions provided here focus on integrating the Flavor Getter plugin into your existing flavor setup. If you haven't set up flavors yet, please refer to the respective platform documentation to configure flavors for your project.

### iOS Setup

1. Open your Flutter project in Xcode by navigating to `ios/Runner.xcworkspace`.
2. In Xcode, select your application target (Runner) and go to the **Build Settings** tab.
3. Under the **User-Defined** section, add a new build setting called `FLAVOR` and set it to the desired flavor value for each scheme.
4. Open the `Info.plist` file located in the `ios/Runner` directory.
5. Add a new entry to the Information Property List with the key `FLAVOR` and the value `$(FLAVOR)`. This will ensure that the flavor value is accessible in the Info.plist file.
6. Save the `Info.plist` file.
7. Build and run your application using the desired scheme and flavor.

### Android Setup

1. Open your Flutter project in Android Studio.
2. Locate the `android/app/build.gradle` file.
3. Inside the `android` block, ensure that the `defaultConfig` section contains the following line:
```groovy
android {
    namespace "com.example.myapp" // Replace with your namespace
    // ...
    defaultConfig {
        // ...
        applicationId "com.example.myapp" // Replace with your applicationId; make sure it's similar to namespace
        // ...
    }
}
```
The applicationId should match the package name defined in your AndroidManifest.xml file.
4. To add flavors, add the following lines to the android block:
```groovy
flavorDimensions "default"

productFlavors {
    dev {
        applicationIdSuffix ".dev"  // com.example.myapp.dev
    }
    prod {
        applicationIdSuffix ".prod"  // com.example.myapp.prod
    }
}
```
Customize the flavor names (dev and prod) and the applicationIdSuffixes (.dev and .prod) to match your desired flavors.

## Usage

To retrieve the current flavor in your Flutter code, you can use the `getFlavor()` function.

```dart
import 'package:flavor_getter/flavor_getter.dart';

void main() async {
	String currentFlavor = await FlavorGetter().getFlavor();
	print('Running in flavor: $currentFlavor');
}
```
## Example

For a complete example of using Flavor Getter, please refer to the example directory of this plugin.

## Issues and Contributions

Please report any issues or bugs you encounter by opening an issue on the GitHub repository. Contributions are also welcome via pull requests.
