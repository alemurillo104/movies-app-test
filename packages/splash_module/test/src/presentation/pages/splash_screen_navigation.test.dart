import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash_module/src/presentation/pages/splash_screen.page.dart';
import 'package:splash_module/navigation/navigation.dart';

void main() {
  group('SplashScreenPage Navigation', () {
    testWidgets('should have correct animation controller duration', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Get the state to access animation controller
      final splashState = tester.state<State<SplashScreenPage>>(
        find.byType(SplashScreenPage),
      ) as dynamic;

      // Assert animation controller duration
      expect(
          splashState._controller.duration, const Duration(milliseconds: 700));
    });

    testWidgets('should start animation after 2 second delay', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Act - pump for 1.9 seconds (just before the 2 second delay)
      await tester.pump(const Duration(milliseconds: 1900));

      // Get the animation controller
      final splashState = tester.state<State<SplashScreenPage>>(
        find.byType(SplashScreenPage),
      ) as dynamic;

      // Assert - animation should not have started yet
      expect(splashState._controller.isAnimating, false);

      // Act - pump remaining time to trigger animation
      await tester.pump(const Duration(milliseconds: 200));

      // Assert - animation should now be started or completed
      expect(
          splashState._controller.status,
          isIn([
            AnimationStatus.forward,
            AnimationStatus.completed,
          ]));
    });

    testWidgets('should have opacity animation from 1 to 0', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Get the state to access animation
      final splashState = tester.state<State<SplashScreenPage>>(
        find.byType(SplashScreenPage),
      ) as dynamic;

      // Assert initial opacity
      expect(splashState._opacityAnimation.value, 1.0);

      // Act - complete the animation
      splashState._controller.forward();
      await tester.pump(const Duration(milliseconds: 700));

      // Assert final opacity
      expect(splashState._opacityAnimation.value, 0.0);
    });

    testWidgets('should dispose animation controller properly', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreenPage(),
        ),
      );

      // Get the animation controller
      final splashState = tester.state<State<SplashScreenPage>>(
        find.byType(SplashScreenPage),
      ) as dynamic;
      final controller = splashState._controller;

      // Act - dispose the widget
      await tester.pumpWidget(const MaterialApp(home: Scaffold()));

      // Assert - controller should be disposed
      expect(controller.isDisposed, true);
    });

    group('Animation Timing', () {
      testWidgets('should complete full cycle in expected time', (
        WidgetTester tester,
      ) async {
        // Arrange
        await tester.pumpWidget(
          const MaterialApp(
            home: SplashScreenPage(),
          ),
        );

        // Act - simulate full splash sequence
        // 1. Wait for initial delay (2 seconds)
        await tester.pump(const Duration(seconds: 2));

        // 2. Animation starts and completes (700ms)
        await tester.pump(const Duration(milliseconds: 700));

        // Get the state
        final splashState = tester.state<State<SplashScreenPage>>(
          find.byType(SplashScreenPage),
        ) as dynamic;

        // Assert - animation should be completed
        expect(splashState._controller.status, AnimationStatus.completed);
      });

      testWidgets('should use SingleTickerProviderStateMixin',
          (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(
          const MaterialApp(
            home: SplashScreenPage(),
          ),
        );

        // Get the state
        final splashState = tester.state<State<SplashScreenPage>>(
          find.byType(SplashScreenPage),
        );

        // Assert - should implement SingleTickerProviderStateMixin
        expect(splashState, isA<SingleTickerProviderStateMixin>());
      });
    });

    group('Navigation Constants', () {
      test('SplashDestination should have correct home route', () {
        // Assert
        expect(SplashDestination.home, '/movies/');
      });
    });
  });
}
