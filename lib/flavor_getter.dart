/*
 * File: flavor_getter.dart
 * Flutter Plugin: Flavor Getter
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 0.0.3
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2023-06-21
 */

import 'flavor_getter_platform_interface.dart';

class FlavorGetter {
  Future<String?> getFlavor() {
    return FlavorGetterPlatform.instance.getFlavor();
  }
}
