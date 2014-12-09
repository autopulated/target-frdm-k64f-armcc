# Copyright (C) 2014 ARM Limited. All rights reserved. 

message("mbedOS-GNU-CXX.cmake included")

# can't test the compiler because it cross-compiles
set(CMAKE_CXX_COMPILER_WORKS TRUE)

# !!! FIXME: CMAKE_AR and CMAKE_LINKER? should be set and used correctly, instead of calling
# armar

set(CMAKE_CXX_CREATE_SHARED_LIBRARY "echo 'shared libraries not supported' && 1")
set(CMAKE_CXX_CREATE_SHARED_MODULE  "echo 'shared modules not supported' && 1")
set(CMAKE_CXX_CREATE_STATIC_LIBRARY "armar -cr <LINK_FLAGS> <TARGET> <OBJECTS>")
set(CMAKE_CXX_COMPILE_OBJECT        "${ARMCC_ENV} <CMAKE_CXX_COMPILER> ${YOTTA_TARGET_DEFINITIONS} <DEFINES> -c <FLAGS> --cpp -o <OBJECT> <SOURCE>")
set(CMAKE_CXX_LINK_EXECUTABLE       "armlink -o <TARGET> <OBJECTS> <LINK_LIBRARIES> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS>")

set(CMAKE_CXX_FLAGS_INIT "${_C_FAMILY_FLAGS_INIT} --no_exceptions")
set(CMAKE_CXX_FLAGS_DEBUG_INIT          "${CMAKE_CXX_FLAGS_INIT} -O0 -g")
set(CMAKE_CXX_FLAGS_MINSIZEREL_INIT     "${CMAKE_CXX_FLAGS_INIT} -Osize -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE_INIT        "${CMAKE_CXX_FLAGS_INIT} -Osize -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "${CMAKE_CXX_FLAGS_INIT} -Osize -g -DNDEBUG")
set(CMAKE_INCLUDE_SYSTEM_FLAG_CXX "-isystem ")

set(CMAKE_CXX_OUTPUT_EXTENSION ".o")

