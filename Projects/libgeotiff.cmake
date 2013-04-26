# libgeotiff v1.4.0 searches for projects.h, but it can be safely ignored
add_external_project_step(patch_libgeotiff_cmakelists
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          "${SuperBuild_PROJECTS_DIR}/patches/libgeotiff.CMakeLists.txt"
          "<SOURCE_DIR>/CMakeLists.txt"
DEPENDEES update # do after update
DEPENDERS patch  # do before patch
)

add_external_project(libgeotiff
  DEPENDS tiff
  CMAKE_ARGS
    -DTIFF_INCLUDE_DIR:PATH=<INSTALL_DIR>/include
    #    -DTIFF_LIBRARY:FILEPATH=<INSTALL_DIR>/lib/libtiff.dylib
#    -DPROJ4_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include
#    -DPROJ4_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/proj_i.lib
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>/libgeotiff
)

#add_external_project_or_use_system(libgeotiff
#  BUILD_IN_SOURCE 1
#  CONFIGURE_COMMAND ""
#  BUILD_COMMAND ${NMAKE_PATH} /f Makefile.vc
#    TIFF_INC=-I"${SuperBuild_BINARY_DIR}/install/include/libtiff"
#    PROJ_INC=-I"${SuperBuild_BINARY_DIR}/install/include"
#    TIFF_LIB_DLL="${SuperBuild_BINARY_DIR}/install/lib/libtiff_i.lib"
#    PROJ_LIB_DLL="${SuperBuild_BINARY_DIR}/install/lib/proj_i.lib"
#    PREFIX="<INSTALL_DIR>"
#  INSTALL_COMMAND ${NMAKE_PATH} /f Makefile.vc devinstall
#)
