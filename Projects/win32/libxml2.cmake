add_external_project_step(patch_libxml2_makefile
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          "${SuperBuild_PROJECTS_DIR}/patches/libxml2.win32.Makefile.txt"
          "<SOURCE_DIR>/Makefile.msvc"
DEPENDEES update # do after update
DEPENDERS configure  # do before configure
)

add_external_project(
  libxml2
  BUILD_IN_SOURCE 1
  UPDATE_COMMAND ""
  SOURCE_DIR ${SuperBuild_BINARY_DIR}/libxml2/src/libxml2/win32
  CONFIGURE_COMMAND cscript <SOURCE_DIR>/configure.js
                    compiler=msvc
                    prefix=<INSTALL_DIR>
                    #incdir=<INSTALL_DIR>/include
                    #libdir=<INSTALL_DIR>/lib
                    static=no
                    iconv=no
  BUILD_COMMAND ${NMAKE_PATH} /f Makefile.msvc
  INSTALL_COMMAND ${NMAKE_PATH} /f Makefile.msvc install
)
