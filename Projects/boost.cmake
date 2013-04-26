
add_external_project(boost
  DEPENDS zlib
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND
    <SOURCE_DIR>/bootstrap.sh --prefix=<INSTALL_DIR>
                              --with-libraries=chrono
                              --with-libraries=date_time
                              --with-libraries=filesystem
                              --with-libraries=system
                              --with-libraries=iostreams
                              --with-libraries=program_options
                              --with-libraries=thread
                              --with-libraries=random
                              --with-libraries=serialization
                              --with-libraries=test
  BUILD_COMMAND <SOURCE_DIR>/bjam
  INSTALL_COMMAND <SOURCE_DIR>/bjam --prefix=<INSTALL_DIR> 
                                    install
)
