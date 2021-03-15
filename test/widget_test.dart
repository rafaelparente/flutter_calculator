// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_calculadora/main.dart';
import 'package:flutter_calculadora/constants.dart' as Constants;

void main() {
  testWidgets('Test orientation change', (WidgetTester tester) async {
    // resets the screen to its orinal size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Landscape to portrait
    tester.binding.window.physicalSizeTestValue = tester.binding.window.physicalSize.flipped;
    await tester.pumpAndSettle();
  });

  testWidgets('Test buttons and output texts', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    final Finder calcularButtonFinder = find.widgetWithText(RaisedButton, 'Calcular');
    final Finder zerarButtonFinder = find.widgetWithText(RaisedButton, 'Zerar');

    expect(find.text(''), findsNWidgets(2));
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isFalse);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isFalse);

    await tester.tap(find.widgetWithText(RaisedButton, '+'));
    await tester.pumpAndSettle();

    expect(find.text(''), findsNWidgets(2));
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isFalse);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isFalse);

    await tester.tap(find.widgetWithText(RaisedButton, '0'));
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isTrue);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isTrue);

    await tester.tap(find.widgetWithText(RaisedButton, '1'));
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isTrue);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isTrue);

    await tester.tap(find.widgetWithText(RaisedButton, '9'));
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isTrue);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isTrue);

    await tester.tap(find.widgetWithText(RaisedButton, '-'));
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isFalse);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isTrue);

    await tester.tap(find.widgetWithText(RaisedButton, '*'));
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isFalse);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isTrue);

    await tester.tap(find.widgetWithText(RaisedButton, '5'));
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isTrue);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isTrue);

    await tester.tap(find.widgetWithText(RaisedButton, '/'));
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isFalse);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isTrue);

    await tester.tap(find.widgetWithText(RaisedButton, '2'));
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isTrue);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isTrue);

    await tester.tap(calcularButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text(''), findsNothing);
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isTrue);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isTrue);

    await tester.tap(zerarButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text(''), findsNWidgets(2));
    expect((tester.widget(calcularButtonFinder) as RaisedButton).enabled, isFalse);
    expect((tester.widget(zerarButtonFinder) as RaisedButton).enabled, isFalse);
  });

  testWidgets('Test math', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    final Finder calcularButtonFinder = find.widgetWithText(RaisedButton, 'Calcular');
    final Finder zerarButtonFinder = find.widgetWithText(RaisedButton, 'Zerar');

    await tester.tap(find.widgetWithText(RaisedButton, '0'));
    await tester.pumpAndSettle();

    await tester.tap(calcularButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text(''), findsNothing);

    await tester.tap(find.widgetWithText(RaisedButton, '/'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, '0'));
    await tester.pumpAndSettle();

    await tester.tap(calcularButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text(Constants.DIV_BY_ZERO_RESULT), findsOneWidget);

    await tester.tap(find.widgetWithText(RaisedButton, '+'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, '7'));
    await tester.pumpAndSettle();

    await tester.tap(calcularButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text(Constants.DIV_BY_ZERO_RESULT), findsOneWidget);

    await tester.tap(zerarButtonFinder);
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, '8'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, '-'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, '3'));
    await tester.pumpAndSettle();

    await tester.tap(calcularButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('5.0'), findsOneWidget);

    await tester.tap(find.widgetWithText(RaisedButton, '*'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, '4'));
    await tester.pumpAndSettle();

    await tester.tap(calcularButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('-4.0'), findsOneWidget);

    await tester.tap(find.widgetWithText(RaisedButton, '+'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, '6'));
    await tester.pumpAndSettle();

    await tester.tap(calcularButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('2.0'), findsOneWidget);

    await tester.tap(find.widgetWithText(RaisedButton, '/'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, '8'));
    await tester.pumpAndSettle();

    await tester.tap(calcularButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('-3.25'), findsOneWidget);
  });
}
