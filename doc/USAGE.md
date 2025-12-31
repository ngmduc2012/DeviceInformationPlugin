# DeviceInformation Usage (Short)

## 1) Add dependency

```yaml
dependencies:
  device_information: ^0.0.5
```

## 2) Import and read values

```dart
import 'package:device_information/device_information.dart';
import 'package:flutter/services.dart';

Future<void> loadDeviceInfo() async {
  try {
    final platformVersion = await DeviceInformation.platformVersion;
    final imeiNo = await DeviceInformation.deviceIMEINumber;
    final modelName = await DeviceInformation.deviceModel;
    final manufacturer = await DeviceInformation.deviceManufacturer;
    final apiLevel = await DeviceInformation.apiLevel;
    final deviceName = await DeviceInformation.deviceName;
    final productName = await DeviceInformation.productName;
    final cpuType = await DeviceInformation.cpuName;
    final hardware = await DeviceInformation.hardware;
  } on PlatformException {
    // Handle errors here.
  }
}
```

## 3) Android permission

Add to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
```

For API 23+, request runtime permission in your app.

## 4) iOS notes

No additional permission is required on iOS. Some fields may be empty depending on OS restrictions.
