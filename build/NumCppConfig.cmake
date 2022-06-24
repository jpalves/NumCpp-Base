# NumCppConfig.cmake
# --------------------
#
# NumCpp cmake module.
# This module sets the following variables in your project::
#
#   NumCpp_FOUND - true if NumCpp found on the system
#   NumCpp_VERSION - NumCpp version in format Major.Minor.Release
#   NumCpp_INCLUDE_DIR - Directory where NumCpp headers are located.
#
# The following variables can be set to guide the search for this package::
#
#   NumCpp_DIR - CMake variable, set to directory containing this Config file
#   CMAKE_PREFIX_PATH - CMake variable, set to root directory of this package
#   PATH - environment variable, set to bin directory of this package
#

####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was NumCppConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

if(NOT TARGET NumCpp::NumCpp)
    include("${CMAKE_CURRENT_LIST_DIR}/NumCppTargets.cmake")
    set_and_check(NumCpp_INCLUDE_DIR "${PACKAGE_PREFIX_DIR}/include")
    check_required_components("NumCpp")

    find_package(Boost REQUIRED)
    set_property(TARGET NumCpp::NumCpp APPEND PROPERTY INTERFACE_LINK_LIBRARIES Boost::headers)

    message(STATUS "Found NumCpp: ${NumCpp_INCLUDE_DIR} (found version ${NumCpp_VERSION})")
endif()
