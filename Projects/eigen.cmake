add_external_project_step(copy_eigen_headers
  COMMAND ${CMAKE_COMMAND} -E copy_directory
          <SOURCE_DIR>/Eigen
          <INSTALL_DIR>/include/Eigen
  DEPENDEES patch # do after patch
)

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
