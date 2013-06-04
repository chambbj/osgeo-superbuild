#add_external_project_step(patch_gdal_nmake_opt
#  COMMAND ${CMAKE_COMMAND} -E copy_if_different
#          "${SuperBuild_PROJECTS_DIR}/patches/gdal.nmake.opt"
#          "<SOURCE_DIR>/nmake.opt"
#DEPENDEES update # do after update
#DEPENDERS patch  # do before patch
#)

add_external_project_or_use_system(gdal
#  DEPENDS libgeotiff tiff
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ${NMAKE_PATH} /f makefile.vc
    MSVC_VER=1600
    GDAL_HOME="<INSTALL_DIR>"
    WIN64=YES
#    GEOTIFF_INC=-I"${SuperBuild_BINARY_DIR}/install/include"
#    GEOTIFF_LIB="${SuperBuild_BINARY_DIR}/install/lib/geotiff_i.lib"
#    TIFF_INC=-I"${SuperBuild_BINARY_DIR}/install/include/libtiff"
#    TIFF_LIB="${SuperBuild_BINARY_DIR}/install/lib/libtiff_i.lib"
  INSTALL_COMMAND ${NMAKE_PATH} /f makefile.vc
    MSVC_VER=1600
    GDAL_HOME="<INSTALL_DIR>"
    WIN64=YES
#    GEOTIFF_INC=-I"${SuperBuild_BINARY_DIR}/install/include"
#    GEOTIFF_LIB="${SuperBuild_BINARY_DIR}/install/lib/geotiff_i.lib"
#    TIFF_INC=-I"${SuperBuild_BINARY_DIR}/install/include/libtiff"
#    TIFF_LIB="${SuperBuild_BINARY_DIR}/install/lib/libtiff_i.lib"
    devinstall
)
