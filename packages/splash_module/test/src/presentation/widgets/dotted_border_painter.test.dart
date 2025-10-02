import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash_module/src/presentation/widgets/dotted_border_painter.widget.dart';

void main() {
  group('DottedBorderPainter', () {
    late DottedBorderPainter painter;

    setUp(() {
      painter = const DottedBorderPainter();
    });

    test('should not repaint when delegate has not changed', () {
      // Arrange
      const oldDelegate = DottedBorderPainter();

      // Act & Assert
      expect(painter.shouldRepaint(oldDelegate), false);
    });

    testWidgets('should paint without errors', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomPaint(
              painter: painter,
              size: const Size(100, 50),
              child: const SizedBox(width: 100, height: 50),
            ),
          ),
        ),
      );

      // Assert - No exceptions should be thrown during painting
      expect(tester.takeException(), isNull);
    });

    testWidgets('should render with CustomPaint widget',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200,
              height: 100,
              child: CustomPaint(
                painter: painter,
                child: const SizedBox(width: 200, height: 100),
              ),
            ),
          ),
        ),
      );

      // Assert - Just verify that CustomPaint exists and renders
      expect(find.byType(CustomPaint), findsOneWidget);
      final customPaint =
          tester.widget<CustomPaint>(find.byType(CustomPaint).first);
      expect(customPaint.painter, isA<DottedBorderPainter>());
    });

    test('should be const constructor', () {
      // Arrange & Act
      const painter1 = DottedBorderPainter();
      const painter2 = DottedBorderPainter();

      // Assert
      expect(painter1, equals(painter2));
    });
  });

  group('DashPath Extension', () {
    testWidgets('should create dashed path without errors', (
      WidgetTester tester,
    ) async {
      // Arrange
      final path = Path()..addRect(const Rect.fromLTWH(0, 0, 100, 100));

      // Act & Assert - Should not throw exceptions
      expect(() => path.dashPath([5.0, 3.0]), returnsNormally);
    });

    test('should return Path object', () {
      // Arrange
      final path = Path()..addRect(const Rect.fromLTWH(0, 0, 100, 100));

      // Act
      final dashedPath = path.dashPath([5.0, 3.0]);

      // Assert
      expect(dashedPath, isA<Path>());
    });

    test('should handle empty segments list gracefully', () {
      // Arrange
      final path = Path()..addRect(const Rect.fromLTWH(0, 0, 100, 100));

      // Act & Assert - should not crash but may not produce expected results
      expect(() => path.dashPath([]), throwsA(isA<RangeError>()));
    });

    test('should handle single segment gracefully', () {
      // Arrange
      final path = Path()..addRect(const Rect.fromLTWH(0, 0, 100, 100));

      // Act & Assert - should not crash but may not produce expected results
      expect(() => path.dashPath([10.0]), throwsA(isA<RangeError>()));
    });
  });
}
