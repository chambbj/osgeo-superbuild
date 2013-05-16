add_external_project_step(patch_flann_serialization
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          "${SuperBuild_PROJECTS_DIR}/patches/flann.serialization.h"
          "<SOURCE_DIR>/src/cpp/flann/util/serialization.h"
  DEPENDEES update # do after update
  DEPENDERS patch  # do before patch
)

add_external_project(flann
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>/flann
)
