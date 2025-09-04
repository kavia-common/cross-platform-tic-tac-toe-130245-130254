import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('App loads with Tic-Tac-Toe header and board', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    expect(find.text('Tic-Tac-Toe'), findsOneWidget);
    expect(find.text('Play & Enjoy'), findsOneWidget);

    // Board should have 9 tappable cells
    // We can tap one cell and ensure mark is placed
    final firstCell = find.byType(InkWell).first;
    await tester.tap(firstCell);
    await tester.pumpAndSettle();

    // Either 'X' should appear (first move)
    expect(find.text('X'), findsWidgets);
  });

  testWidgets('Restart button resets the board', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // Make a move
    final firstCell = find.byType(InkWell).first;
    await tester.tap(firstCell);
    await tester.pumpAndSettle();

    // Restart
    await tester.tap(find.text('Restart'));
    await tester.pumpAndSettle();

    // Board should be empty (no X or O present)
    expect(find.text('X'), findsNothing);
    expect(find.text('O'), findsNothing);
  });
}
