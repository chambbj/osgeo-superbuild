add_external_project_or_use_system(tiff
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR>
    --without-x
  BUILD_COMMAND make
  INSTALL_COMMAND make install
)

#add_external_project_step(install_libtiff_libraries
#  COMMAND ${CMAKE_COMMAND} -E copy_if_different
#                              <BINARY_DIR>/libtiff/libtiff.dll
#                              <INSTALL_DIR>/bin

#  COMMAND ${CMAKE_COMMAND} -E copy_if_different
#                              <BINARY_DIR>/libtiff/libtiff.lib
#                              <INSTALL_DIR>/lib/.

#  COMMAND ${CMAKE_COMMAND} -E copy_if_different
#                              <BINARY_DIR>/libtiff/libtiff_i.lib
#                              <INSTALL_DIR>/lib

  # this particular step is an ugly hack, we only want the
  # headers, but it seems I can't specify a wildcard for the
  # copy command
  #  COMMAND ${CMAKE_COMMAND} -E copy_directory
  #                            <BINARY_DIR>/libtiff
  #                            <INSTALL_DIR>/include/libtiff

  #  DEPENDEES build # do after build
  #)
