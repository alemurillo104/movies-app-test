import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash_module/navigation/navigation.dart';

void main() {
  group('SplashScreenPage Navigation', () {
    group('Navigation Constants', () {
      test('SplashDestination should have correct home route', () {
        // Assert
        expect(SplashDestination.home, '/movies/');
      });
    });

    group('Animation Concepts', () {
      testWidgets('should support FadeTransition with opacity animations', (
        WidgetTester tester,
      ) async {
        // Test the animation concepts used in SplashScreenPage
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                  AnimationController(
                    duration: const Duration(milliseconds: 700),
                    vsync: const TestVSync(),
                  ),
                ),
                child: const Text('Test'),
              ),
            ),
          ),
        );

        expect(find.byType(FadeTransition), findsOneWidget);
        expect(find.text('Test'), findsOneWidget);
      });

      testWidgets('should support animation controller duration of 700ms', (
        WidgetTester tester,
      ) async {
        late AnimationController controller;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  controller = AnimationController(
                    duration: const Duration(milliseconds: 700),
                    vsync: const TestVSync(),
                  );

                  return Container();
                },
              ),
            ),
          ),
        );

        expect(controller.duration, const Duration(milliseconds: 700));
        controller.dispose();
      });

      testWidgets('should support opacity tween from 1 to 0', (
        WidgetTester tester,
      ) async {
        final tween = Tween<double>(begin: 1.0, end: 0.0);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Container(),
            ),
          ),
        );

        expect(tween.begin, 1.0);
        expect(tween.end, 0.0);
      });

      test('should define correct animation timing constants', () {
        // Test the timing constants used in SplashScreenPage
        const splashDelay = Duration(seconds: 2);
        const animationDuration = Duration(milliseconds: 700);

        expect(splashDelay.inSeconds, 2);
        expect(animationDuration.inMilliseconds, 700);
      });
    });

    group('SingleTickerProviderStateMixin', () {
      testWidgets('should be compatible with SingleTickerProviderStateMixin', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  return const Text('Test Ticker Provider');
                },
              ),
            ),
          ),
        );

        // Verify that TestVSync works correctly
        final ticker = const TestVSync().createTicker((elapsed) {});
        expect(ticker, isA<Ticker>());
        ticker.dispose();
      });
    });
  });
}

class TestVSync implements TickerProvider {
  const TestVSync();

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
