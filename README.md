regression_android
==================

This repo contains scripts to run Boost regression tests on Linux and Windows hosts.


Prerequirements/HowTo
==================
1. Install Android ADT and Android SDK
2. `adb` programm from Android SDK must be visible from console (its folder must be in your PATH env varible PATH=${PATH}:/home/antoshkka/boost_maintain/android/adt-bundle-linux-x86_64-20130522/sdk/platform-tools/)
3. Virtual (or rooted) Android device must be pluged to host and running
4. Copy user-config.jam to yout home folder and setup the correct path to Android NDK
5. Add modifications to linux/config.txt. It will be used instead of comment.html in final report
6. run ./run.sh
