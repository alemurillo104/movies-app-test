import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash_module/src/presentation/widgets/logo.widget.dart';
import 'package:splash_module/src/presentation/pages/splash_screen.page.dart';

void main() {
  group('SplashScreenPage', () {
    testWidgets('should display LogoWidget', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Assert
      expect(find.byType(LogoWidget), findsOneWidget);
    });

    testWidgets('should have correct gradient background',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Assert
      final decoratedBox = tester.widget<DecoratedBox>(
        find.byType(DecoratedBox),
      );
      final decoration = decoratedBox.decoration as BoxDecoration;
      final gradient = decoration.gradient as LinearGradient;

      expect(gradient.colors, [
        const Color(0xFF000000),
        const Color(0xFF6A0707),
      ]);
      expect(gradient.begin, Alignment.topCenter);
      expect(gradient.end, Alignment.bottomCenter);
    });

    testWidgets('should be centered on screen', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Assert
      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets('should have FadeTransition animation',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Assert
      expect(find.byType(FadeTransition), findsOneWidget);
    });

    testWidgets('should complete animation after 2 seconds',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Act - advance time by 2 seconds
      await tester.pump(const Duration(seconds: 2));

      // Verify animation controller starts
      expect(find.byType(FadeTransition), findsOneWidget);

      // Act - complete the animation (700ms duration)
      await tester.pump(const Duration(milliseconds: 700));

      // Assert - animation should be completed
      final fadeTransition = tester.widget<FadeTransition>(
        find.byType(FadeTransition),
      );
      expect(fadeTransition.opacity.value, equals(0.0));
    });

    testWidgets('should have Scaffold structure', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
