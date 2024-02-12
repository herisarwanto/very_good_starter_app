import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_starter_app/app/router/app_router.dart';
import 'package:very_good_starter_app/l10n/l10n.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: widget,
      ),
    );
  }

  Future<void> pumpAppRouter(
      String location,
      Widget Function(Widget child) builder, {
        bool isConnected = true,
      }) {
    return pumpWidget(
      MaterialApp.router(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routeInformationProvider: router(location).routeInformationProvider,
        routeInformationParser: router(location).routeInformationParser,
        routerDelegate: router(location).routerDelegate,
      ),
    );
  }
}

