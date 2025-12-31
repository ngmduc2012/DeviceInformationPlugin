[![codecov](https://codecov.io/gh/Hina-Hussain/DeviceInformationPlugin/branch/main/graph/badge.svg)](https://codecov.io/gh/Hina-Hussain/DeviceInformationPlugin)
[![GitHub](https://img.shields.io/badge/Hina_Hussain-GitHub-black?logo=github)](https://github.com/Hina-Hussain)

`device_information` is a Flutter plugin that returns device info such as IMEI (Android), model, manufacturer, API level, CPU type, product name, and hardware for Android and iOS.

## Features

- Simple static API for common device fields.
- Works on Android and iOS.
- Optional IMEI on Android with runtime permission.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  device_information: ^0.0.5
```

Install by running:

```sh
flutter pub get
```

## Quick start

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

## Android permission

Add the permission to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
```

For API 23+, request runtime permission in your app. IMEI access may be restricted depending on Android version and device policy.

## iOS notes

No additional permission is required on iOS. Some fields may be empty depending on OS restrictions.

## API list

- `DeviceInformation.platformVersion`
- `DeviceInformation.deviceIMEINumber`
- `DeviceInformation.deviceModel`
- `DeviceInformation.deviceManufacturer`
- `DeviceInformation.apiLevel`
- `DeviceInformation.deviceName`
- `DeviceInformation.productName`
- `DeviceInformation.cpuName`
- `DeviceInformation.hardware`

## Docs

- Usage guide: `doc/USAGE.md`
- Operations: `doc/OPERATIONS.md`
- Example app: `example/`

## Contribution

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Developer Team

Hina Hussain and her team members (Kamran Khan, Abdul Sattar, Faiza Farooqui).

## Follow me

https://hina-hussain-developer.medium.com/creating-publisher-account-on-the-pub-dev-cf86b91cd2f
https://hinahussaindev.blogspot.com/2021/05/creating-publisher-account-on-pubdev.html

## License

[MIT](https://choosealicense.com/licenses/mit/)
