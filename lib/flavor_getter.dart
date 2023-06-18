import 'flavor_getter_platform_interface.dart';

class FlavorGetter {
  Future<String?> getFlavor() {
    return FlavorGetterPlatform.instance.getFlavor();
  }
}
