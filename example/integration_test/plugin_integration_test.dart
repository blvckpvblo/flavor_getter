/*
 * File: plugin_integration_test.dart
 * Flutter Plugin: Flavor Getter
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 0.0.4
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2025-05-15
 */

import 'package:flavor_getter/flavor_getter.dart';
import 'package:flavor_getter_example/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getFlavor test', (widgetTester) async {
    await widgetTester.pumpWidget(const MyApp());
    await widgetTester.pumpAndSettle();
    final flavor = await FlavorGetter().getFlavor();

    expect(find.textContaining('Running in flavor: $flavor'), findsOneWidget);
  });
}
