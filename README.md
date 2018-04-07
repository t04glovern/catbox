![CatBox Banner](/assets/project-banner.jpg)

<div align = "center">
    <h1>CatBox</h1>
    <p>View cats that are up for adoption</p>
    <a href="https://www.dartlang.org/" target="_blank"><img src="https://img.shields.io/badge/Dart-2.0.0-ff69b4.svg?longCache=true&style=for-the-badge" alt="Dart"></a>
    <a href="https://flutter.io/" target="_blank"><img src="https://img.shields.io/badge/Flutter-0.2.3-3BB9FF.svg?longCache=true&style=for-the-badge" alt="Flutter"></a>
    <a href="https://firebase.google.com/" target="_blank"><img src="https://img.shields.io/badge/Firebase-Cloud-orange.svg?longCache=true&style=for-the-badge" alt="Firebase"></a>
    <a href="https://gradle.org/" target="_blank"><img src="https://img.shields.io/badge/Gradle-4.4-green.svg?longCache=true&style=for-the-badge" alt="Gradle"></a>
</div>

## About

A Flutter app that displays cats that are up for adoption along with information about them.

## Building

You can follow these instructions to build the CatBox app and install it onto your device.

### Prerequisites

If you are new to Flutter, please first follow the [Flutter Setup](https://flutter.io/setup/) guide.

#### Google API Configs

Obtain a copy of `GoogleService-Info.plist` and `google-services.json` from the firebase console and put them in the following directories if you need to build for release

```bash
./ios/Runner/GoogleService-Info.plist
./android/app/google-services.json
```

#### Keystore & Signing Keys

Obtain a copy of `catbox.jks` and `key.properties` and place them in the following locations

```bash
./catbox.jks
./android/key.properties
```

### Build/Debug App

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

### Deploying Firebase Configuration

First install the firebase-tools package

```bash
npm install -g firebase-tools
```

Run the following to login to `firebase` cli

```bash
firebase login
```

Run the following within your `./firebase/functions/` directory if you are deploying functions

```bash
npm install
```

Make all the necessary changes within `./firebase/` in this project repository and then push the configuration using the following.


```bash
$ firebase deploy

=== Deploying to 'catbox-flutter'...

i  deploying storage, firestore, functions
i  storage: checking storage.rules for compilation errors...
✔  storage: rules file storage.rules compiled successfully
i  firestore: checking firestore.rules for compilation errors...
✔  firestore: rules file firestore.rules compiled successfully
i  functions: ensuring necessary APIs are enabled...
✔  functions: all necessary APIs are enabled
i  storage: uploading rules storage.rules...
i  firestore: uploading rules firestore.rules...
i  functions: preparing functions directory for uploading...
i  functions: packaged functions (43.55 KB) for uploading
✔  functions: functions folder uploaded successfully
✔  storage: released rules storage.rules to firebase.storage/catbox-flutter.appspot.com
✔  firestore: released rules firestore.rules to cloud.firestore
i  functions: updating function testFunc...
i  functions: updating function onLikeCat...
i  functions: updating function onUnlikeCat...
✔  functions[testFunc]: Successful update operation.
✔  functions[onUnlikeCat]: Successful update operation.
✔  functions[onLikeCat]: Successful update operation.

✔  Deploy complete!
```

### Generating the App Icons

Icon was created using: https://pub.dartlang.org/packages/flutter_launcher_icons

```bash
flutter pub get
flutter pub pub run flutter_launcher_icons:main
```

### Build Issues

#### `MissingPluginException`

If you are getting a missing plugin exception (likely due to Firestore Cloud) simply run the following to clear out the old builds

```bash
flutter clean
flutter packages get
```

## Screenshots

![CatBox App](/assets/project-dashboard.jpg)

## Authors

* Nathan Glover [@nathangloverAUS (Twitter)](https://twitter.com/nathangloverAUS), [@t04glovern (Github)](https://github.com/t04glovern)
* Rico Beti [@RicoBeti (Twitter)](https://twitter.com/RicoBeti), [@silentbyte (Github)](https://github.com/SilentByte)

### Attribution

* [CodemateLtd/FlutterMates](https://github.com/CodemateLtd/FlutterMates) - Base template

