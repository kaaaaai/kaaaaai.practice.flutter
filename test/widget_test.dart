// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdemo/CartPractice/CataLog.dart';

import 'package:flutterdemo/main.dart';
import 'package:flutterdemo/unit_test_widget.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('MyWidget has a title and message', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const UnitWidget(title: 'T', message: 'M'));
  });

  testWidgets('finds a deep item in a long list', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( MyCatalog() );

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('自定义测试50'));

    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    // Verify that the item contains the correct text.
    expect(itemFinder, findsOneWidget);
  });
}
