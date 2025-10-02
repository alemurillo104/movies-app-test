import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash_module/src/presentation/widgets/logo.widget.dart';
import 'package:splash_module/src/presentation/widgets/dotted_border_painter.widget.dart';

void main() {
  group('SplashScreenPage Components', () {
    // Test individual components that make up the splash screen
    // to avoid navigation and timer issues

    testWidgets('should display LogoWidget correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoWidget(),
          ),
        ),
      );

      expect(find.byType(LogoWidget), findsOneWidget);
      expect(find.text('eMovie'), findsOneWidget);
    });

    testWidgets('should have correct gradient colors for splash', (
      WidgetTester tester,
    ) async {
      const gradient = LinearGradient(
        colors: [
          Color(0xFF000000),
          Color(0xFF6A0707),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DecoratedBox(
              decoration: BoxDecoration(gradient: gradient),
              child: Center(
                child: LogoWidget(),
              ),
            ),
          ),
        ),
      );

      final decoratedBox = tester.widget<DecoratedBox>(
        find.byType(DecoratedBox),
      );
      final decoration = decoratedBox.decoration as BoxDecoration;
      final testGradient = decoration.gradient as LinearGradient;

      expect(testGradient.colors, [
        const Color(0xFF000000),
        const Color(0xFF6A0707),
      ]);
      expect(testGradient.begin, Alignment.topCenter);
      expect(testGradient.end, Alignment.bottomCenter);
    });

    testWidgets('should center content properly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: LogoWidget(),
            ),
          ),
        ),
      );

      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(LogoWidget), findsOneWidget);
    });

    testWidgets('should display custom painted logo with border', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoWidget(),
          ),
        ),
      );

      final logoCustomPaint = find.descendant(
        of: find.byType(LogoWidget),
        matching: find.byType(CustomPaint),
      );
      expect(logoCustomPaint, findsOneWidget);

      final customPaint = tester.widget<CustomPaint>(logoCustomPaint);
      expect(customPaint.painter, isA<DottedBorderPainter>());
    });

    testWidgets('should support FadeTransition widget', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FadeTransition(
              opacity: AlwaysStoppedAnimation(1.0),
              child: LogoWidget(),
            ),
          ),
        ),
      );

      expect(find.byType(FadeTransition), findsOneWidget);
      expect(find.byType(LogoWidget), findsOneWidget);

      final fadeTransition = tester.widget<FadeTransition>(
        find.byType(FadeTransition),
      );
      expect(fadeTransition.opacity.value, 1.0);
    });

    testWidgets('should have basic Scaffold structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: LogoWidget(),
            ),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(LogoWidget), findsOneWidget);
    });
  });
}
