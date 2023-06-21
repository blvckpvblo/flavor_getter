/*
 * File: flavor_getter_method_channel.dart
 * Flutter Plugin: Flavor Getter
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 1.0.0
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2023-06-21
 */

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
    final flavor = await methodChannel.invokeMethod<String>('getFlavor');
    return flavor;
  }
}
