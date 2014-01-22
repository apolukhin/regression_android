@ECHO OFF
SET ANDROID_EXEC_DIR=/data/local/tmp/
echo "Input arguments are %*" 1>>d:/testing_boost_android/run_on_android_log.txt 2>&1
adb push "%1" %ANDROID_EXEC_DIR% 1>NUL 2>&1
adb shell "chmod 777 %ANDROID_EXEC_DIR%/%~n1%~x1; cd %ANDROID_EXEC_DIR%; ./%~n1%~x1 1>%ANDROID_EXEC_DIR%/%~n1.errorlog 2>&1; echo -n exit $?" 1>ec.bat 2>>d:/testing_boost_android/run_on_android_log.txt
adb shell "rm -f %ANDROID_EXEC_DIR%/%~n1%~x1; chmod 666 %ANDROID_EXEC_DIR%/%~n1.errorlog; cat %ANDROID_EXEC_DIR%/%~n1.errorlog" >>d:/testing_boost_android/run_on_android_log.txt 2>&1
adb shell "cat %ANDROID_EXEC_DIR%/%~n1.errorlog" 2>NUL 
adb shell "rm -f %ANDROID_EXEC_DIR%/%~n1.errorlog ; rm -f %ANDROID_EXEC_DIR%/%~n1%~x1;" 1>NUL 2>&1
ec.bat