import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flavor_getter_platform_interface.dart';

/// An implementation of [FlavorGetterPlatform] that uses method channels.
class MethodChannelFlavorGetter extends FlavorGetterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flavor_getter');

  @override
  Future<String?> getFlavor() async {
    final version = await methodChannel.invokeMethod<String>('getFlavor');
    return version;
  }
}
