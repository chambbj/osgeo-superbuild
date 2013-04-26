add_external_project(
  libxml2
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --enable-shared
                    --enable-static=no
  BUILD_IN_SOURCE 1
)
