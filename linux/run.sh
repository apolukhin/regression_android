# Copyright (c) 2013 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

LAUNCHER=`pwd`/run_on_android.sh

mkdir build
cd build
rm ./comment.html
cp ../config.txt ./comment.html
source ../config.txt

rm run.py
wget https://raw.github.com/boostorg/boost/develop/tools/regression/src/run.py

chmod +x run.py
./run.py "--bjam-options=testing.launcher=${LAUNCHER} -j4 -d+4 threadapi=pthread target-os=android toolset=${TOOLSETNAME}" --tag=${TAGNAME} --bjam-toolset=gcc-toolsets --pjl-toolset=gcc-toolsets --runner=${RUNNERNAME} --incremental
