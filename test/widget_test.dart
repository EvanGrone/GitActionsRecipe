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
    await tester.pumpWidget(MyApp()); // Replace with your app's main widget

    // Verify that the app title is displayed.
    expect(find.text('Recipe App'), findsOneWidget);

    // Verify that the initial ingredient dropdown is not empty.
    expect(find.byType(DropdownButton), findsOneWidget);

    // Tap on the dropdown to open it.
    await tester.tap(find.byType(DropdownButton));
    await tester.pump();

    // Verify that the dropdown items are displayed.
    expect(find.text('Bananas'), findsOneWidget);

    // Select an ingredient from the dropdown.
    await tester.tap(find.text('Bananas'));
    await tester.pump();

    // Verify that the selected ingredient is displayed in the list.
    expect(find.text('Bananas'), findsOneWidget);

    // Verify that the Remove button removes the selected ingredient.
    await tester.tap(find.text('Remove'));
    await tester.pump();

    // Verify that the selected ingredient is removed from the list.
    expect(find.text('Bananas'), findsNothing);

    // Verify that the GO! button triggers the recipe matching dialog.
    await tester.tap(find.text('GO!'));
    await tester.pump();

    // Verify that the matching recipes dialog is displayed.
    expect(find.text('Matching Recipes'), findsOneWidget);
  });
}
