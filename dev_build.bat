@echo off

REM places which need to be changed to your needs are wrapped in * characters

set TARGET=*target*

set SRC_DIR=*.\..\src*
set SRC_FILES=*%SRC_DIR%\main.c*

set BUILD_DIR=build

set CL_FLAGS=/GA /FC /Gd /Fe:%TARGET% /Fo:%TARGET% /I *include1* /I *include2* /std:c17 /Zi /MD /nologo /utf-8 /W4 /WX

set LIBS=*glfw3.lib glew32.lib opengl32.lib gdi32.lib shell32.lib user32.lib kernel32.lib*
set LINK_FLAGS=/MACHINE:x86 /LIBPATH:*lib_dir1* /LIBPATH:*lib_dir2* /nologo %LIBS%

pushd %BUILD_DIR%

cl %CL_FLAGS% %SRC_FILES% /link %LINK_FLAGS%

IF /I "%1"=="run" (.\%TARGET%.exe)

popd