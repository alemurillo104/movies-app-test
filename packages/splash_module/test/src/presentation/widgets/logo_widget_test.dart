import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash_module/src/presentation/widgets/logo.widget.dart';
import 'package:splash_module/src/presentation/widgets/dotted_border_painter.widget.dart';

void main() {
  group('LogoWidget', () {
    testWidgets('should display "eMovie" text', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoWidget(),
          ),
        ),
      );

      // Assert
      expect(find.text('eMovie'), findsOneWidget);
    });

    testWidgets('should have correct text styling',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoWidget(),
          ),
        ),
      );

      // Assert
      final textWidget = tester.widget<Text>(find.text('eMovie'));
      expect(textWidget.style?.color, Colors.white);
      expect(textWidget.style?.fontSize, 32);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      expect(textWidget.style?.letterSpacing, 1.5);
    });

    testWidgets('should have CustomPaint with DottedBorderPainter', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoWidget(),
          ),
        ),
      );

      // Assert - find the specific CustomPaint within LogoWidget
      final logoCustomPaint = find.descendant(
        of: find.byType(LogoWidget),
        matching: find.byType(CustomPaint),
      );
      expect(logoCustomPaint, findsOneWidget);

      final customPaint = tester.widget<CustomPaint>(logoCustomPaint);
      expect(customPaint.painter, isA<DottedBorderPainter>());
    });

    testWidgets('should have correct container padding', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoWidget(),
          ),
        ),
      );

      // Assert
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding,
          const EdgeInsets.symmetric(horizontal: 5, vertical: 2));
    });

    testWidgets('should render without errors', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoWidget(),
          ),
        ),
      );

      // Assert - No exceptions should be thrown
      expect(tester.takeException(), isNull);
    });

    testWidgets('should have proper widget hierarchy', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoWidget(),
          ),
        ),
      );

      // Assert widget tree structure
      expect(
        find.descendant(
          of: find.byType(CustomPaint),
          matching: find.byType(Container),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(Container),
          matching: find.text('eMovie'),
        ),
        findsOneWidget,
      );
    });
  });
}
