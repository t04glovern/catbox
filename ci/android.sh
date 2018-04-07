#!/bin/sh
start_time=`date +%s`

cd android &&
./gradlew assembleRelease &&
# ./gradlew assembleDebug
# ./gradlew --status
# ./gradlew assembleRelease
# java -Dorg.gradle.appname=gradlew -classpath gradle/wrapper/gradle-wrapper.jar org.gradle.wrapper.GradleWrapperMain -q -Ptarget=../lib/main.dart assembleRelease
# java -Xmx256M -Dfile.encoding=UTF-8 -Duser.country=US -Duser.language=en -Duser.variant -cp ~/.gradle/wrapper/dists/gradle-4.4-all/9br9xq1tocpiv8o6njlyu5op1/gradle-4.4/lib/gradle-launcher-4.4.jar org.gradle.launcher.daemon.bootstrap.GradleDaemon 4.4

cd ../

rm build/app/outputs/apk/release/app-release.apk
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 build/app/outputs/apk/release/app-release-unsigned.apk $storealias -keystore catbox.jks -storepass $storepass -keypass $keypass
jarsigner -verify -verbose build/app/outputs/apk/release/app-release-unsigned.apk
$ANDROID_HOME/build-tools/26.0.3/zipalign -v 4 build/app/outputs/apk/release/app-release-unsigned.apk build/app/outputs/apk/release/app-release.apk

adb install -r build/app/outputs/apk/release/app-release.apk &&
# adb install -r build/app/outputs/apk/debug/app-debug.apk

adb shell am start -n com.nathanglover.catbox/com.nathanglover.catbox.MainActivity

echo run time is $(expr `date +%s` - $start_time) s