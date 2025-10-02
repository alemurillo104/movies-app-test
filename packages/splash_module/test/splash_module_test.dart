import 'package:flutter_test/flutter_test.dart';
import 'package:splash_module/splash_module.dart';

void main() {
  group('Splash Module', () {
    test('should export SplashScreenPage', () {
      // This test verifies that the main export is working
      expect(SplashScreenPage, isNotNull);
    });
  });
}
