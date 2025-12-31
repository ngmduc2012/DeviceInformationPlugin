import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_information/device_information.dart';

void main() {
  const MethodChannel channel = MethodChannel('device_information');

  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('returns values from platform channel', () async {
    final calls = <MethodCall>[];
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      calls.add(methodCall);
      switch (methodCall.method) {
        case 'getPlatformVersion':
          return 'test-version';
        case 'getIMEINumber':
          return 'test-imei';
        case 'getAPILevel':
          return 30;
        case 'getModel':
          return 'test-model';
        case 'getManufacturer':
          return 'test-manufacturer';
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

    expect(await DeviceInformation.platformVersion, 'test-version');
    expect(await DeviceInformation.deviceIMEINumber, 'test-imei');
    expect(await DeviceInformation.apiLevel, 30);
    expect(await DeviceInformation.deviceModel, 'test-model');
    expect(await DeviceInformation.deviceManufacturer, 'test-manufacturer');
    expect(await DeviceInformation.deviceName, 'test-device');
    expect(await DeviceInformation.productName, 'test-product');
    expect(await DeviceInformation.cpuName, 'test-cpu');
    expect(await DeviceInformation.hardware, 'test-hardware');

    expect(calls.map((call) => call.method).toList(), [
      'getPlatformVersion',
      'getIMEINumber',
      'getAPILevel',
      'getModel',
      'getManufacturer',
      'getDevice',
      'getProduct',
      'getCPUType',
      'getHardware',
    ]);
  });

  test('returns empty string when platform returns null', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return null;
    });

    expect(await DeviceInformation.platformVersion, '');
    expect(await DeviceInformation.deviceIMEINumber, '');
    expect(await DeviceInformation.apiLevel, '');
    expect(await DeviceInformation.deviceModel, '');
    expect(await DeviceInformation.deviceManufacturer, '');
    expect(await DeviceInformation.deviceName, '');
    expect(await DeviceInformation.productName, '');
    expect(await DeviceInformation.cpuName, '');
    expect(await DeviceInformation.hardware, '');
  });
}
