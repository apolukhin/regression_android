SET LAUNCHER=%cd%/run_on_android.bat
pushd "%~dp0"
call F:\"Program Files (x86)"\"Microsoft Visual Studio 11.0"\VC\vcvarsall.bat
run.py "--bjam-options=testing.launcher=%LAUNCHER% -j7 -d+4 threadapi=pthread target-os=android toolset=gcc-androiddebug" --bjam-toolset=msvc --pjl-toolset=msvc --runner=apolukhin-Android-winhost --tag=develop --incremental
