add_external_project(pcl
  DEPENDS boost flann
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>/pcl
 )
