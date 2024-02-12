import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_starter_app/features/home/presentation/view/home_page.dart';

import '../../../../helpers/configure_injector.dart';

void main() async {
  setUpAll(() async {
    // Konfigurasi di sebelum menjalankan tes
    await configureInjector();
  });

  group('HomePage', () {
    testWidgets('renders GameList', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      await tester.pumpAndSettle();
      // expect(find.byType(GamesList), findsOneWidget);
    });
  });
}
