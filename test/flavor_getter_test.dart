import 'package:flutter_test/flutter_test.dart';
import 'package:flavor_getter/flavor_getter.dart';
import 'package:flavor_getter/flavor_getter_platform_interface.dart';
import 'package:flavor_getter/flavor_getter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlavorGetterPlatform
    with MockPlatformInterfaceMixin
    implements FlavorGetterPlatform {
  @override
  Future<String?> getFlavor() => Future.value('42');
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

    expect(await flavorGetterPlugin.getFlavor(), '42');
  });
}
