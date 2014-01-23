# Copyright (c) 2013 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

BINARY_NAME=${1##*/}
ANDROID_EXEC_DIR=/data/local/tmp/

echo "Input arguments are $*" 1>>./run_on_android_log.txt 2>&1
adb push "$1" ${ANDROID_EXEC_DIR} 1>/dev/null 2>&1
adb shell "chmod 777 ${ANDROID_EXEC_DIR}/${BINARY_NAME}; ${ANDROID_EXEC_DIR}/${BINARY_NAME} 1>${ANDROID_EXEC_DIR}/${BINARY_NAME}.errorlog 2>&1; echo -n exit $?" 1>ec.sh 2>>./run_on_android_log.txt
adb shell "rm -f ${ANDROID_EXEC_DIR}/${BINARY_NAME}; chmod 666 ${ANDROID_EXEC_DIR}/${BINARY_NAME}.errorlog; cat ${ANDROID_EXEC_DIR}/${BINARY_NAME}.errorlog" >>./run_on_android_log.txt 2>&1
adb shell "cat ${ANDROID_EXEC_DIR}/${BINARY_NAME}.errorlog" 2>/dev/null
adb shell "rm -f ${ANDROID_EXEC_DIR}/${BINARY_NAME}.errorlog ; rm -f ${ANDROID_EXEC_DIR}/${BINARY_NAME};" 1>/dev/null 2>&1
chmod +x ec.sh
wait `lsof -t ec.sh` 1>/dev/null 2>&1
./ec.sh
