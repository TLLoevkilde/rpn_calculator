import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rpn_calculator/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Enter a number', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());


    expect(find.textByKey("Stack"), equals('[]'));

    await tester.enterDigits('123');

    await tester.tap(find.byKey(Key("Enter")));
    await tester.pump();

    expect(find.textByKey("Stack"), equals('[123.0]'));
  });


}

extension FinderExtensions on CommonFinders {
  String? textByKey(String keyString) {
    final text = byKey(Key(keyString)).evaluate().single.widget as Text;
    return text.data;
  }
}


extension TesterExtensions on WidgetTester {
  Future<void> enterDigits(String digits) async {
    for (var digit in digits.characters) {
      await tapByKey(Key(digit));
    }
  }

  Future<void> tapByKey(Key key) async {
    await tap(find.byKey(key));
    await pump();
  }
}