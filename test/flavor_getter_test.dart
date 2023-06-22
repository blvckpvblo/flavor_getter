/*
 * File: flavor_getter_test.dart
 * Flutter Plugin: Flavor Getter
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 0.0.2
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2023-06-22
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:flavor_getter/flavor_getter.dart';
import 'package:flavor_getter/flavor_getter_platform_interface.dart';
import 'package:flavor_getter/flavor_getter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlavorGetterPlatform
    with MockPlatformInterfaceMixin
    implements FlavorGetterPlatform {
  @override
  Future<String?> getFlavor() => Future.value('dev');
}

void main() {
  final FlavorGetterPlatform initialPlatform = FlavorGetterPlatform.instance;

  test('$MethodChannelFlavorGetter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlavorGetter>());
  });

  test('getFlavor', () async {
    FlavorGetter flavorGetterPlugin = FlavorGetter();
    MockFlavorGetterPlatform fakePlatform = MockFlavorGetterPlatform();
    FlavorGetterPlatform.instance = fakePlatform;

    expect(await flavorGetterPlugin.getFlavor(), 'dev');
  });
}
