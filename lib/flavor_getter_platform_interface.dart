/*
  * File: flavor_getter_platform_interface.dart
 * Flutter Plugin: Flavor Getter
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 0.0.4
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2025-05-15
 */

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flavor_getter_method_channel.dart';

abstract class FlavorGetterPlatform extends PlatformInterface {
  /// Constructs a FlavorGetterPlatform.
  FlavorGetterPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlavorGetterPlatform _instance = MethodChannelFlavorGetter();

  /// The default instance of [FlavorGetterPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlavorGetter].
  static FlavorGetterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlavorGetterPlatform] when
  /// they register themselves.
  static set instance(FlavorGetterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getFlavor() {
    throw UnimplementedError('getFlavor() has not been implemented.');
  }
}
