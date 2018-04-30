#!/bin/bash
set -e

set -x

# Background for not using Travis's built-in Android tags
# https://github.com/flutter/plugins/pull/145
# Copied from https://github.com/flutter/plugins/blame/master/.travis.yml
wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
mkdir android-sdk
unzip -qq sdk-tools-linux-3859397.zip -d android-sdk
export ANDROID_HOME=`pwd`/android-sdk
export PATH=`pwd`/android-sdk/tools/bin:$PATH
mkdir -p /home/travis/.android # silence sdkmanager warning
set +x # Travis's env variable hiding is a bit wonky. Don't echo back this line.
if [ -n "$ANDROID_GALLERY_UPLOAD_KEY" ]; then
  echo "$ANDROID_GALLERY_UPLOAD_KEY" | base64 --decode > /home/travis/.android/debug.keystore
fi
set -x
echo 'count=0' > /home/travis/.android/repositories.cfg # silence sdkmanager warning
# suppressing output of sdkmanager to keep log under 4MB (travis limit)
echo y | sdkmanager "tools" >/dev/null
echo y | sdkmanager "platform-tools" >/dev/null
echo y | sdkmanager "build-tools;26.0.3" >/dev/null
echo y | sdkmanager "platforms;android-26" >/dev/null
echo y | sdkmanager "extras;android;m2repository" >/dev/null
echo y | sdkmanager "extras;google;m2repository" >/dev/null
echo y | sdkmanager "patcher;v4" >/dev/null
sdkmanager --list
wget http://services.gradle.org/distributions/gradle-4.1-bin.zip
unzip -qq gradle-4.1-bin.zip
export GRADLE_HOME=$PWD/gradle-4.1
export PATH=$GRADLE_HOME/bin:$PATH
gradle -v

# disable analytics on the bots and download Flutter dependencies
./flutter/bin/flutter config --no-analytics

# run pub get in all the repo packages
./flutter/bin/flutter update-packages