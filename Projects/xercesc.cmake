add_external_project(
  xercesc
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
  BUILD_IN_SOURCE 1
)
