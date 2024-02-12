import 'package:injectable/injectable.dart';
import 'package:very_good_starter_app/injector.dart';

Future<void> configureInjector() async {
  await configureDependencies(environment: Environment.test);
}
