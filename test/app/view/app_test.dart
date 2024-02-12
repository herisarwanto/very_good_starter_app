import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_starter_app/app/router/app_router.dart';

import '../../helpers/configure_injector.dart';
import '../../helpers/pump_app.dart';

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await configureInjector();
  });

  setUp(() => GoogleFonts.config.allowRuntimeFetching = false);
  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpAppRouter(
        AppRouter.home,
            (child) => child,
        isConnected: false,
      );
      expect(find.byType(MaterialApp, skipOffstage: false), findsOneWidget);
    });
  });
}
