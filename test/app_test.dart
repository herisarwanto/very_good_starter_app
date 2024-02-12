import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_starter_app/app/view/app.dart';
import 'package:very_good_starter_app/features/home/presentation/view/home_page.dart';

import 'helpers/configure_injector.dart';

void main() async {
  group('App', () {
    setUpAll(() async {
      // Konfigurasi di sebelum menjalankan tes
      await configureInjector();
    });

    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(App());
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
