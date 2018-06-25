![CatBox Banner](/assets/project-banner.jpg)

<div align = "center">
    <h1>CatBox</h1>
    <p>View cats that are up for adoption</p>
    <a href="https://www.dartlang.org/" target="_blank"><img src="https://img.shields.io/badge/Dart-2.0.0-ff69b4.svg?longCache=true&style=for-the-badge" alt="Dart"></a>
    <a href="https://flutter.io/" target="_blank"><img src="https://img.shields.io/badge/Flutter-0.5.1-3BB9FF.svg?longCache=true&style=for-the-badge" alt="Flutter"></a>
    <a href="https://firebase.google.com/" target="_blank"><img src="https://img.shields.io/badge/Firebase-Cloud-orange.svg?longCache=true&style=for-the-badge" alt="Firebase"></a>
    <a href="https://gradle.org/" target="_blank"><img src="https://img.shields.io/badge/Gradle-4.1-green.svg?longCache=true&style=for-the-badge" alt="Gradle"></a>
</div>

## About

A Flutter app that displays cats that are up for adoption along with information about them.

This application was built as an example application for [The Complete Flutter and Firebase Developer Course](https://www.udemy.com/flutter-development/?couponCode=GITHUB2018), if you'd like to learn how to build this application from scratch you can use our coupon code [GITHUB2018](https://www.udemy.com/flutter-development/?couponCode=GITHUB2018).

[![CatBox Banner](/assets/announcement-banner.png)](https://www.udemy.com/flutter-development/?couponCode=GITHUB2018)

## Download

CatBox is live on Google Play and in the process of being approved on the iOS App store.

[<img src="https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png" alt="Get it on Google Play" height="80">](https://play.google.com/store/apps/details?id=com.nathanglover.catbox)

## TODO

- [ ] Launch adoption page using [url_launcher](https://pub.dartlang.org/packages/url_launcher)
- [ ] Change Firestore schema to new naming convention
- [x] Live Cat item reference so we can do updates to the UI in sync with Firestore changes
- [ ] Add Cat description field

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

etc...

✔  Deploy complete!
```

### Generating the App Icons

Icon was created using: https://pub.dartlang.org/packages/flutter_launcher_icons

```bash
flutter pub get
flutter pub pub run flutter_launcher_icons:main
```

Due to a difference in the way that iOS and Android handle transparency, there's a separate icon file for iOS and a method for toggling on and off the icon changes in the `pubspec.yaml`

## Build Issues

#### `MissingPluginException`

If you are getting a missing plugin exception (likely due to Firestore Cloud) simply run the following to clear out the old builds

```bash
flutter clean
flutter packages get
```

#### Can't Compile Debug APK

If you are unable to compile a debug version of the APK go into `./android/app/build.gradle` and change the following line (comment out release and add the debug config)

```xml
buildTypes {
    release {
        //signingConfig signingConfigs.release
        signingConfig signingConfigs.debug
    }
}
```

#### iOS Build Fails around `BoringSSL/internal.h`

As Flutter is still in development and more importantly, the external packages that tie in to services like Google Play are still changing a lot, there's often some teething issues with breaking dependencies and build. Run the following in to hopefully resolve most of the issues

```bash
cd ios/
rm -rf Pods/ Podfile.lock ; pod install
```

## Screenshots

![CatBox App](/assets/project-dashboard.jpg)

## Authors

* Nathan Glover [@nathangloverAUS (Twitter)](https://twitter.com/nathangloverAUS), [@t04glovern (Github)](https://github.com/t04glovern)
* Rico Beti [@RicoBeti (Twitter)](https://twitter.com/RicoBeti), [@silentbyte (Github)](https://github.com/SilentByte)

### Attribution

* [CodemateLtd/FlutterMates](https://github.com/CodemateLtd/FlutterMates) - Base template

