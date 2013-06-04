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

add_external_project(pdal
  DEPENDS boost libgeotiff gdal laszip tiff flann libxml2

  CMAKE_ARGS
    -DBoost_NO_BOOST_CMAKE:BOOL=ON
    -DBoost_USE_MULTITHREADED:BOOL=ON
    -DBoost_USE_STATIC_LIBS:BOOL=ON
    -DBoost_NO_SYSTEM_PATHS:BOOL=ON
    -DBoost_DEBUG:BOOL=OFF # we leave this, because finding Boost can be tricky
    -DBOOST_ROOT:PATH=${SuperBuild_BINARY_DIR}/install/include/boost-1_53
    -DBOOST_INCLUDEDIR:PATH=${SuperBuild_BINARY_DIR}/install/include/boost-1_53
    -DBOOST_LIBRARYDIR:PATH=${SuperBuild_BINARY_DIR}/install/lib
    -DPDAL_EMBED_BOOST:BOOL=OFF
    -DPDAL_USE_STATIC_RUNTIME:BOOL=OFF
    -DWITH_FLANN:BOOL=OFF
    -DWITH_GDAL:BOOL=ON
    -DWITH_GEOTIFF:BOOL=ON
    -DWITH_LASZIP:BOOL=OFF
    -DWITH_APPS:BOOL=OFF
    -DWITH_LIBXML2:BOOL=OFF
    -DFLANN_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include
    -DFLANN_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/flann_cpp_s.lib
    -DGDAL_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include
    -DGDAL_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/gdal_i.lib
    -DGEOTIFF_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include
    -DGEOTIFF_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/geotiff_i.lib
    -DLASZIP_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include
    -DLASZIP_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/laszip.lib
    -DTIFF_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include/libtiff
    -DTIFF_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/libtiff_i.lib
    -DLIBXML2_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/install/include/libxml2
    -DLIBXML2_LIBRARY:FILEPATH=${SuperBuild_BINARY_DIR}/install/lib/libxml2.lib
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>/pdal
)

message( STATUS "${CMAKE_BUILD_TYPE}" )

add_external_project_step(rename_pdal_lib
  COMMAND ${CMAKE_COMMAND} -E rename
          "${SuperBuild_BINARY_DIR}/install/lib/pdal.lib"
          "${SuperBuild_BINARY_DIR}/install/lib/pdal-vc100.lib"
  DEPENDEES install # do after install
)
