# laszip v2.1.0 includes two projects that do not build and
# frankly aren't needed for our purposes: package and OSGeo4W
add_external_project_step(patch_laszip_cmakelists
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          "${SuperBuild_PROJECTS_DIR}/patches/laszip.CMakeLists.txt"
          "<SOURCE_DIR>/CMakeLists.txt"
DEPENDEES update # do after update
DEPENDERS patch  # do before patch
)

add_external_project(laszip
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>/laszip
)
