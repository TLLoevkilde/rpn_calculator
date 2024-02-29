import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rpn_calculator/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Enter a number', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Find widget by key and cast to `Text`
    final text =
    find.byKey(const Key("Stack")).evaluate().single.widget as Text;
    // `text.data` is the string that is displayed by the text widget
    expect(text.data, equals('[]'));

    // Convert the number we want to enter to a string.
    // Then loop over the digits.
    for (final digit in '123'.characters) {
      // Find the corresponding button for a digit and tap it.
      await tester.tap(find.byKey(Key(digit)));
      // Trigger update
      await tester.pump();
    }

    await tester.tap(find.byKey(Key("Enter")));
    await tester.pump();

    // We now expect a widget with the text "123"
    expect(find.text("[123]"), findsOneWidget);
  });
}