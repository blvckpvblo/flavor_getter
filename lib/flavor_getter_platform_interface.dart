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
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
