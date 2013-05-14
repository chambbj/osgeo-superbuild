#add_external_project_step(patch_pdal_cmakelists
#  COMMAND ${CMAKE_COMMAND} -E copy_if_different
#          "${SuperBuild_PROJECTS_DIR}/patches/pdal.CMakeLists.txt"
#          "<SOURCE_DIR>/CMakeLists.txt"
#  COMMAND ${CMAKE_COMMAND} -E copy_if_different
#          "${SuperBuild_PROJECTS_DIR}/patches/pdal.src.CMakeLists.txt"
#          "<SOURCE_DIR>/src/CMakeLists.txt"
#  DEPENDEES update # do after update
#  DEPENDERS patch  # do before patch
#)

add_external_project(liblas
  DEPENDS boost libgeotiff gdal laszip tiff

  CMAKE_ARGS
    -DBoost_NO_BOOST_CMAKE:BOOL=ON
    -DBoost_USE_MULTITHREADED:BOOL=ON
    -DBoost_USE_STATIC_LIBS:BOOL=ON
    -DBoost_NO_SYSTEM_PATHS:BOOL=ON
    -DBoost_DEBUG:BOOL=OFF # we leave this, because finding Boost can be tricky
    -DBOOST_ROOT:PATH=${SuperBuild_BINARY_DIR}/install/include/boost-1_53
    -DBOOST_INCLUDEDIR:PATH=${SuperBuild_BINARY_DIR}/install/include/boost-1_53
    -DBOOST_LIBRARYDIR:PATH=${SuperBuild_BINARY_DIR}/install/lib
    -DWITH_GDAL:BOOL=ON
    -DWITH_GEOTIFF:BOOL=ON
    -DWITH_LASZIP:BOOL=ON
    -DWITH_UTILITIES:BOOL=OFF
    -DGDAL_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include
    -DGDAL_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/gdal_i.lib
    -DGEOTIFF_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include
    -DGEOTIFF_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/geotiff_i.lib
    -DLASZIP_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include
    -DLASZIP_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/laszip.lib
    -DTIFF_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include/libtiff
    -DTIFF_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/libtiff_i.lib
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>/pdal
)
