/*
 * File: flavor_getter_method_channel_test.dart
 * Flutter Plugin: Flavor Getter
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 0.0.4
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2025-05-15
 */

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flavor_getter/flavor_getter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlavorGetter platform = MethodChannelFlavorGetter();
  const MethodChannel channel = MethodChannel('flavor_getter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return 'dev';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getFlavor', () async {
    expect(await platform.getFlavor(), 'dev');
  });
}
