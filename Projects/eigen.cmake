add_external_project_step(copy_eigen_headers
  COMMAND ${CMAKE_COMMAND} -E copy_directory
          <SOURCE_DIR>/Eigen
          <INSTALL_DIR>/include/Eigen
  DEPENDEES patch # do after patch
)

#add_external_project_step(rename_eigen_download
#  COMMAND ${CMAKE_COMMAND} -E copy <DOWNLOAD_DIR>/eigen-eigen-2249f9c22fe8.tar.gz <DOWNLOAD_DIR>/eigen-3.1.2.tar.gz
#  DEPENDEES download # do after download
#  DEPENDERS patch # do before patch
#)

# eigen install consists entirely of copying the headers,
# not sure i can do that as part of add_external_project,
# so it's a separate step, and this is just a dummy
add_external_project_or_use_system(
  eigen
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)
