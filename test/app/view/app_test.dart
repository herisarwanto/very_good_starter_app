import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_starter_app/app/app.dart';
import 'package:very_good_starter_app/features/home/presentation/view/home_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
