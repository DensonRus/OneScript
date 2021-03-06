cmake_minimum_required(VERSION 3.10)

project("ScriptEngine.NativeApi")
set(TARGET "ScriptEngine.NativeApi")

add_library(${TARGET} SHARED
	NativeApiProxy.cpp
	NativeInterface.cpp
	NativeInterface.h)

target_compile_definitions(${TARGET} PRIVATE UNICODE _UNICODE)
target_include_directories(${TARGET} PRIVATE include)

if (UNIX)
	if (TARGET_ARCH STREQUAL "x86")
		set(CMAKE_CXX_FLAGS "-m32 ${CMAKE_CXX_FLAGS}")
	else(UNIX)
		set(CMAKE_CXX_FLAGS "-m64 ${CMAKE_CXX_FLAGS}")
	endif ()
else(UNIX)
	if (NOT MSVC)
		message(FATAL_ERROR "Must be compiled with MSVC on Windows")
	endif(NOT MSVC)
	add_definitions(/MT)
	set(CMAKE_SUPPRESS_REGENERATION 1)
	set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)
	target_compile_definitions(${TARGET} PRIVATE _WINDOWS)
endif(UNIX)
