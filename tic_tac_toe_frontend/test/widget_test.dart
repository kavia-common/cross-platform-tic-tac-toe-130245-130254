import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('App shows Tic-Tac-Toe title', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    await tester.pumpAndSettle();

    expect(find.text('Tic-Tac-Toe'), findsWidgets);
  });

  testWidgets('Initial status shows Player X\'s turn', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    await tester.pumpAndSettle();

    expect(find.text('Player X\'s turn'), findsOneWidget);
  });
}
