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
