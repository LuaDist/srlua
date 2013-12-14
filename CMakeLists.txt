# Copyright (C) 2012 LuaDist.
# Created by Peter Drahoš, Peter Kapec
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

project ( srlua C )
cmake_minimum_required ( VERSION 2.8 )
include ( cmake/dist.cmake )

find_package ( Lua REQUIRED )
include_directories(${LUA_INCLUDE_DIR})

add_executable(glue glue.c glue.rc)
add_executable(srlua srlua.c srlua.rc)

target_link_libraries(glue ${LUA_LIBRARIES})
target_link_libraries(srlua ${LUA_LIBRARIES})

# No console version on windows
if (WIN32)
  add_executable(wsrlua WIN32 wmain.c srlua.c srlua.rc)
  target_link_libraries(wsrlua ${LUA_LIBRARIES})
  install_executable(wsrlua)
elseif ( APPLE )
  set ( CMAKE_EXE_LINKER_FLAGS "-pagezero_size 10000 -image_base 100000000 -image_base 7fff04c4a000" )
endif()

install_executable(glue srlua)
install_data(README.md)
install_test(test.lua)
