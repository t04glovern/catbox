import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets('app should load cats', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new CatBoxApp());

    // Verify we can find the Header label Cats
    expect(find.text('Cats'), findsOneWidget);
    expect(find.text('Dogs'), findsNothing);
  });
}
