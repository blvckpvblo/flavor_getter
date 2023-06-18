
import 'flavor_getter_platform_interface.dart';

class FlavorGetter {
  Future<String?> getPlatformVersion() {
    return FlavorGetterPlatform.instance.getPlatformVersion();
  }
}
