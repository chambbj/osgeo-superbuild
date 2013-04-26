add_external_project(proj
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR>
  #  PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different
  #        "${SuperBuild_PROJECTS_DIR}/patches/proj.makefile.vc"
  #        "<SOURCE_DIR>/makefile.vc"
  BUILD_COMMAND make
  INSTALL_COMMAND make install
)
