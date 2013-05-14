cmake_minimum_required(VERSION 2.8.8)

#if (APPLE)
#  if(NOT CMAKE_OSX_DEPLOYMENT_TARGET)
#    message(WARNING "Ensure that CMAKE_OSX_SYSROOT, CMAKE_OSX_DEPLOYMENT_TARGET are set correctly")
#    set(CMAKE_OSX_ARCHITECTURES "x86_64" CACHE STRING "By default, build for 64-bit Leopard")
#  endif()
#endif()

project(OSGEOSuperBuild)
set (SuperBuild_CMAKE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/CMake")
set (SuperBuild_PROJECTS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Projects")
set (SuperBuild_BINARY_DIR ${OSGEOSuperBuild_BINARY_DIR})

include(CMakeDependentOption)

#-----------------------------------------------------------------------------
# Collect information about the build platform.
include(CheckTypeSize)
check_type_size(void* VOID_PTR_SIZE BUILTIN_TYPES_ONLY)
if (VOID_PTR_SIZE EQUAL 8)
  set (64bit_build TRUE)
else ()
  set (64bit_build FALSE)
endif()

set (platform)
if (APPLE)
  set (platform "apple")
  option(APPLY_MOUNTAIN_LION_FIX "Apply Mountain Lion bundle fix" OFF)
  mark_as_advanced(APPLY_MOUNTAIN_LION_FIX)
elseif (UNIX)
  set (platform "unix")
elseif (WIN32)
  set (platform "win32")
endif()

# Set suffix to be used for generating archives. This ensures that the package
# files have decent names that we can directly upload to the website.
set (package_suffix "${CMAKE_SYSTEM_NAME}")
if (64bit_build)
  set (package_suffix "${package_suffix}-64bit")
else ()
  set (package_suffix "${package_suffix}-32bit")
endif()


option(TRUST_SVN_CERTIFICATES_AUTOMATICALLY
  "Trust SVN certificates automatically" ON)
mark_as_advanced(TRUST_SVN_CERTIFICATES_AUTOMATICALLY)

#-----------------------------------------------------------------------------
# Setup CMAKE_MODULE_PATH so that platform specific configurations are processed
# before the generic ones.
set (CMAKE_MODULE_PATH
  "${SuperBuild_PROJECTS_DIR}/${platform}"
  "${SuperBuild_PROJECTS_DIR}/common"
  "${SuperBuild_PROJECTS_DIR}"
  "${SuperBuild_CMAKE_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}"
  ${CMAKE_MODULE_PATH})

#-----------------------------------------------------------------------------
# Setup some standard variables that control various locations and flags.
set (install_location "${CMAKE_CURRENT_BINARY_DIR}/install")
set (download_location "${CMAKE_CURRENT_BINARY_DIR}/downloads"
     CACHE PATH "Location where source tar-balls are (to be) downloaded.")
mark_as_advanced(download_location)

if (WIN32)
  set (ldflags)
  set (cppflags)
  set (cxxflags)
  set (ld_library_path)
else ()
  # FIXME: currently, if any of these are empty, we have build issues on Unix.
  set (ldflags "$ENV{LDFLAGS} -L${install_location}/lib")
  set (cppflags "$ENV{CPPFLAGS} -fPIC")
  set (cxxflags "$ENV{CXXFLAGS} -fPIC")
  set (cflags "$ENV{CFLAGS} -fPIC")
  set (ld_library_path "${install_location}/lib:$ENV{LD_LIBRARY_PATH}")
endif()

if (UNIX AND NOT APPLE)
  # I am not exactly sure about the cause of these issues and how to cleanly
  # overcome them, however, on some linuxes when Cmake is built shared, we end
  # if we set LD_LIBRARY_PATH to the install/lib dir, we end up with errors
  # due to conflicts with system libz. So for now, I am making this an option.
  # By default we will let the superbuild scripts set LD_LIBRARY_PATH. However
  # if users get errors like: libz.so.1: no version information available, then
  # users should turn this flag off.
  option(PASS_LD_LIBRARY_PATH_FOR_BUILDS
         "Pass LD_LIBRARY_PATH to build scripts."
         ON)
  mark_as_advanced(PASS_LD_LIBRARY_PATH_FOR_BUILDS)
endif()

#if (APPLE)
#  set (cflags "${cflags} -arch x86_64 -mmacosx-version-min=${CMAKE_OSX_DEPLOYMENT_TARGET} -sysroot=${CMAKE_OSX_SYSROOT} ")
#  set (cppflags "${cppflags} -arch x86_64 -mmacosx-version-min=${CMAKE_OSX_DEPLOYMENT_TARGET} -sysroot=${CMAKE_OSX_SYSROOT} ")
#  set (cxxflags "${cxxflags} -arch x86_64 -mmacosx-version-min=${CMAKE_OSX_DEPLOYMENT_TARGET} -sysroot=${CMAKE_OSX_SYSROOT} ")
#endif()
set (prefix_path "${install_location}")

# merge in default/user-specified CMake flags.
set (ldflags "${CMAKE_SHARED_LINKER_FLAGS} ${ldflags}")
set (cppflags "${CMAKE_CXX_FLAGS} ${cppflags}")
set (cxxflags "${CMAKE_CXX_FLAGS} ${cxxflags}")
set (cflags "${CMAKE_C_FLAGS} ${cflags}")

string (STRIP "${ldflags}" ldflags)
string (STRIP "${cppflags}" cppflags)
string (STRIP "${cxxflags}" cxxflags)
string (STRIP "${cflags}"  cflags)
#-----------------------------------------------------------------------------
## Top-level options. These must be limited to a commonly used subset with
## default values being used for building ParaView binaries.
#option(PV_COMMAND_LINE_TOOLS_ONLY
#  "Turn this ON to build command lines tools alone." OFF)

if (WIN32)
  if ( (NOT "${CMAKE_GENERATOR}" MATCHES "^NMake.*$") OR
       (NOT "${CMAKE_GENERATOR}" MATCHES "^Visual Studio.*$"))
  # not use VS environment. We need to be pointed to nmake and devenv paths
  # since they are needed when building tools (qt, python, etc.)
    find_program(DEVENV_PATH devenv)
    find_program(NMAKE_PATH nmake)
    mark_as_advanced(DEVENV_PATH NMAKE_PATH)
  endif()
  # Freetype uses its own build system on win32...
#  find_program(FTJAM_EXECUTABLE jam)
#  mark_as_advanced(FTJAM_EXECUTABLE)
#  if (freetype_ENABLED)
#    if (NOT FTJAM_EXECUTABLE)
#      message(FATAL_ERROR "FreeType's 'jam' build tool not found! Download it from http://sourceforge.net/projects/freetype/files/ftjam/2.5.2/ and set FTJAM_EXECUTABLE appropriately.")
#    endif()
#  endif()
endif()
#-----------------------------------------------------------------------------
include (ParaViewModules)
include (versions)

#------------------------------------------------------------------------------
# enable testing support.
#include(CTest)
#configure_file(
#  "${SuperBuild_CMAKE_DIR}/CTestCustom.cmake.in"
#  "${CMAKE_CURRENT_BINARY_DIR}/CTestCustom.cmake" @ONLY)
#------------------------------------------------------------------------------

#-----------------------------------------------------------------------------
set (CM_PROJECTS_ALL)

option(BUILD_all "Request to build all projects" OFF)
if(BUILD_all)
  message(STATUS "Building ALL projects!")
  set(ENABLE_boost ON)
  set(ENABLE_eigen ON)
  set(ENABLE_flann ON)
  set(ENABLE_gdal ON)
  set(ENABLE_laszip ON)
  set(ENABLE_libgeotiff ON)
  set(ENABLE_liblas ON)
  set(ENABLE_libxml2 ON)
  set(ENABLE_pcl ON)
  set(ENABLE_pdal ON)
  set(ENABLE_proj ON)
  set(ENABLE_qhull ON)
  set(ENABLE_tiff ON)
  set(ENABLE_xercesc ON)
  set(ENABLE_zlib ON)
endif()

# Include all optional projects. These are the ones user can pick and choose.
# Some of these allow using system libraries too.
include(boost)
include(eigen)
include(flann)
include(gdal)
include(laszip)
include(libgeotiff)
include(liblas)
include(libxml2)
include(pcl)
include(pdal)
include(proj)
include(qhull)
include(tiff)
include(xercesc)
include(zlib)

#if (UNIX)
#  # Supported on Linux/Mac
#  include(ffmpeg)
#endif()

#if (UNIX AND NOT APPLE)
#  include(fontconfig)
#  include(mesa)
#endif()

# Build CosmologyTools on Linux and OS X
#if (UNIX)
#  include(qhull)
#  include(diy)
#  include(cosmologytools)
#endif()

# REMEMBER to tell VTK/ParaView to use VTK_SYSTEM_* for the
# libraries we've built here.
#include(paraview)
#include(vistrails)
#include(acusolve)

#option(NIGHTLY_BINARY_TESTING "Run Nightly-Binary ParaView Testing" OFF)
#if (NIGHTLY_BINARY_TESTING)
#  add_subdirectory(tests)
#endif()

#include(vistrails_plugin)
#include(nektar_plugin)
#include(mili_plugin)
process_dependencies()

#if (paraview_ENABLED)
#  include(paraview.bundle OPTIONAL)
#endif()
