// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_github_workflow/main.dart';

void main() {
  testWidgets('App UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed.
    expect(find.text('Recipe App'), findsOneWidget);

    // Verify the initial state of the dropdown.
    expect(find.byType(DropdownButton), findsOneWidget);
    expect(find.text('Bananas'), findsOneWidget);

    // Tap on the dropdown to open it.
    await tester.tap(find.byType(DropdownButton));
    await tester.pump();

    // Verify that the dropdown items are displayed.
    expect(find.text('Bananas'), findsOneWidget);

    // Verify the initial state of the Remove and GO! buttons.
    expect(find.text('Remove'), findsOneWidget);
    expect(find.text('GO!'), findsOneWidget);

    // Verify that the selected ingredients list is initially empty.
    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('Add and remove ingredients', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Add an ingredient to the selected list.
    await tester.tap(find.byType(DropdownButton));
    await tester.pump();
    await tester.tap(find.text('Blueberries'));
    await tester.pump();

    // Verify that the selected ingredient is displayed in the list.
    expect(find.text('Blueberries'), findsOneWidget);

    // Remove the selected ingredient.
    await tester.tap(find.text('Remove'));
    await tester.pump();

    // Verify that the selected ingredient is removed from the list.
    expect(find.text('Blueberries'), findsNothing);
  });
}
