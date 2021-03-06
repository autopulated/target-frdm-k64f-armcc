# Copyright (C) 2014-2015 ARM Limited. All rights reserved. 

if(TARGET_FRDM_K64F_ARMCC_TOOLCHAIN_INCLUDED)
    return()
endif()
set(TARGET_FRDM_K64F_ARMCC_TOOLCHAIN_INCLUDED 1)

# provide compatibility definitions for compiling with this target: these are
# definitions that legacy code assumes will be defined. Before adding something
# here, think VERY CAREFULLY if you can't change anywhere that relies on the
# definition that you're about to add to rely on the TARGET_LIKE_XXX
# definitions that yotta provides based on the target.json file.
#
add_definitions("-DCPU_MK64FN1M0VMD12 -DTARGET_K64F")

# append non-generic flags, and set K64F-specific link script
# no fpu specified for this target, will be revised once uvisor gets FPU support
set(_CPU_COMPILATION_OPTIONS "--CPU=Cortex-M4 -D__thumb2__")

set(CMAKE_C_FLAGS_INIT             "${CMAKE_C_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_ASM_FLAGS_INIT           "${CMAKE_ASM_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_CXX_FLAGS_INIT           "${CMAKE_CXX_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
#set(CMAKE_MODULE_LINKER_FLAGS_INIT "${CMAKE_MODULE_LINKER_FLAGS_INIT}")
set(CMAKE_EXE_LINKER_FLAGS_INIT    "${CMAKE_EXE_LINKER_FLAGS_INIT} --scatter ${CMAKE_CURRENT_LIST_DIR}/../ld/MK64F.sct") 
