
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:very_good_starter_app/counter/counter.dart';

class AppRouter extends Equatable {
  static const home = 'counter';

  @override
  List<Object> get props => [];
}

GoRouter router([String? initialLocation]) => GoRouter(
  debugLogDiagnostics: kDebugMode || kProfileMode,
  initialLocation: initialLocation ?? '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRouter.home,
      builder: (context, state) => const CounterPage(),
    ),
  ],
);
