#!/bin/bash
set -ex

GITHUB_RELEASE_VERSION="0.7.2"
USER_NAME="t04glovern"
REPO_NAME="catbox"
TAG_NAME="auto-build"

export PATH="$PWD/flutter/bin:$PWD/flutter/bin/cache/dart-sdk/bin:$PATH"

echo "Building Application"
if [ "$TRAVIS_OS_NAME" = "linux" ]; then
  export ANDROID_HOME=`pwd`/android-sdk
  export PATH=`pwd`/android-sdk/tools/bin:$PATH
  flutter build apk --release
  jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 build/app/outputs/apk/release/app-release-unsigned.apk $storealias -keystore catbox.jks -storepass $storepass -keypass $keypass
  jarsigner -verify -verbose build/app/outputs/apk/release/app-release-unsigned.apk
  $ANDROID_HOME/build-tools/26.0.3/zipalign -v 4 build/app/outputs/apk/release/app-release-unsigned.apk build/app/outputs/apk/release/app-release.apk
  echo "Android Application built"

  echo "Deploying Android application to Github"

  wget "https://github.com/aktau/github-release/releases/download/v$GITHUB_RELEASE_VERSION/linux-amd64-github-release.tar.bz2"
  mkdir github-release
  tar xvjf linux-amd64-github-release.tar.bz2 -C github-release

  ./github-release/bin/linux/amd64/github-release delete -u $USER_NAME -r $REPO_NAME --tag $TAG_NAME
  ./github-release/bin/linux/amd64/github-release release -u $USER_NAME -r $REPO_NAME --tag $TAG_NAME --name "Pre Release $(date)"
  ./github-release/bin/linux/amd64/github-release upload -u $USER_NAME -r $REPO_NAME --tag $TAG_NAME --name "app-release.apk" --file build/app/outputs/apk/release/app-release.apk -R
  echo "Android Deploy Successful"

elif [ "$TRAVIS_OS_NAME" = "osx" ]; then
  echo "Building Application for iOS..."
  flutter build ios --release --no-codesign
  echo "iOS Application built"

  # echo "Deploying Ios application to Github"
  # wget "https://github.com/aktau/github-release/releases/download/v$GITHUB_RELEASE_VERSION/darwin-amd64-github-release.tar.bz2"
  # mkdir github-release
  # tar xvjf darwin-amd64-github-release.tar.bz2 -C github-release
  # ./github-release/bin/darwin/amd64/github-release upload -u $USER_NAME -r $REPO_NAME --tag $TAG_NAME --name "Runner.app" --file build/ios/iphoneos/Runner.app -R
  # echo "iOS Deploy Successful"

fi