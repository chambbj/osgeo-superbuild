add_external_project(boost
  DEPENDS zlib
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND
    <SOURCE_DIR>/bootstrap.bat
  BUILD_COMMAND <SOURCE_DIR>/b2 --prefix=<INSTALL_DIR>
                                --with-chrono
                                --with-date_time
                                --with-filesystem
                                --with-system
                                --with-iostreams
                                --with-program_options
                                --with-thread
                                --with-random
                                --with-serialization
                                --with-test
                                address-model=64
                                --build-type=complete
                                install
  INSTALL_COMMAND ""
)
