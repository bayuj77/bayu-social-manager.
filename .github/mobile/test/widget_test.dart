import 'package:flutter_test/flutter_test.dart';
import 'package:bayu_social_manager/app.dart';

void main() {
  testWidgets('App renders splash screen initially', (WidgetTester tester) async {
    await tester.pumpWidget(const BayuSocialApp());

    expect(find.text('Bayu Social Manager'), findsOneWidget);
    expect(find.text('1.0.0-dev (Phase 1)'), findsOneWidget);
  });
}
