# nmake is unhappy with the install-all target, so this
# patch renames it to install
#add_external_project_step(patch_proj4_makefile
#  COMMAND ${CMAKE_COMMAND} -E copy_if_different
#          "${SuperBuild_PROJECTS_DIR}/patches/proj.makefile.vc"
#          "<SOURCE_DIR>/makefile.vc"
#DEPENDEES update # do after update
#DEPENDERS patch  # do before patch
#)

add_external_project(proj
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND ""
  PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different
          "${SuperBuild_PROJECTS_DIR}/patches/proj.makefile.vc"
          "<SOURCE_DIR>/makefile.vc"
  BUILD_COMMAND ${NMAKE_PATH} /f Makefile.vc INSTDIR="<INSTALL_DIR>"
  INSTALL_COMMAND ${NMAKE_PATH} /f Makefile.vc INSTDIR="<INSTALL_DIR>" devinstall
)