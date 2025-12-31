// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:device_information_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

const MethodChannel _channel = MethodChannel('device_information');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    _channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getPlatformVersion':
          return 'test-version';
        case 'getIMEINumber':
          return 'test-imei';
        case 'getModel':
          return 'test-model';
        case 'getManufacturer':
          return 'test-manufacturer';
        case 'getAPILevel':
          return 30;
        case 'getDevice':
          return 'test-device';
        case 'getProduct':
          return 'test-product';
        case 'getCPUType':
          return 'test-cpu';
        case 'getHardware':
          return 'test-hardware';
        default:
          return null;
      }
    });
  });

  tearDown(() {
    _channel.setMockMethodCallHandler(null);
  });

  testWidgets('Verify Platform version', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    // Verify that platform version is retrieved.
    expect(
      find.textContaining('Running on :'),
      findsOneWidget,
    );
  });
}
