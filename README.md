<div align = "center">
    <h1>CatBox</h1>
    <p>View cats that are up for adoption</p>
    <a href="https://www.dartlang.org/" target="_blank"><img src="https://img.shields.io/badge/Dart-2.0.0-ff69b4.svg?longCache=true&style=for-the-badge" alt="Dart"></a>
    <a href="https://flutter.io/" target="_blank"><img src="https://img.shields.io/badge/Flutter-SDK-3BB9FF.svg?longCache=true&style=for-the-badge" alt="Flutter"></a>
</div>

## About

A Flutter app written for the Flutter Udemy course. The premise is to display cats that are up for adoption along with information about them.

## Building

You can follow these instructions to build the CatBox app and install it onto your device.

### Prerequisites

If you are new to Flutter, please first follow the [Flutter Setup](https://flutter.io/setup/) guide.

### Building and installing the CatBox app

```bash
cd catbox
flutter upgrade
flutter run --release
```

The `flutter run --release` command both builds and installs the CatBox app.

If you are debugging the application on a simulator, run the following to launch the iOS simulator

```bash
open -a Simulator
```

Then run the following to debug with live reloading

```bash
flutter run --debug
```

## Icon

Icon was created using: https://pub.dartlang.org/packages/flutter_launcher_icons

```bash
flutter pub get
flutter pub pub run flutter_launcher_icons:main
```
