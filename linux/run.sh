LAUNCHER=`pwd`/run_on_android.sh

mkdir build
cd build
rm ./comment.html
cp ../config.txt ./comment.html
source ../config.txt

rm run.py
wget https://raw.github.com/boostorg/boost/develop/tools/regression/src/run.py

chmod +x run.py
./run.py "--bjam-options=testing.launcher=${LAUNCHER} -j7 -d+4 threadapi=pthread target-os=linux toolset=${TOOLSETNAME}" --tag=${TAGNAME} --bjam-toolset=gcc-toolsets --pjl-toolset=gcc-toolsets --runner=${RUNNERNAME} --incremental
