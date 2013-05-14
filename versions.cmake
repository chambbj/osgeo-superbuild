# This maintains the links for all sources used by this superbuild.
# Simply update this file to change the revision.
# One can use different revision on different platforms.
# e.g.
# if (UNIX)
#   ..
# else (APPLE)
#   ..
# endif()

# We are currently unable to download on ILE, so all URLs are local filesystem paths

add_revision(boost
  URL "http://downloads.sourceforge.net/project/boost/boost/1.53.0/boost_1_53_0.tar.gz"
  URL_MD5 57a9e2047c0f511c4dfcf00eb5eb2fbb
)

# download link does not match download filename
add_revision(eigen
	#  URL "P:/tilt-3rd-party-source/eigen-3.1.2.bz2"
	#  URL "http://bitbucket.org/eigen/eigen/get/3.1.3.tar.gz"
	#  URL_MD5 dc4247efd4f5d796041f999e8774af04
	#  HG_REPOSITORY "https://bitbucket.org/eigen/eigen"
	#  HG_TAG 3.1.3
  GIT_REPOSITORY "https://bitbucket.org/chambbj/eigen-fork.git"
  GIT_TAG master
)

add_revision(flann
  URL "http://people.cs.ubc.ca/~mariusm/uploads/FLANN/flann-1.8.4-src.zip"
  URL_MD5 a0ecd46be2ee11a68d2a7d9c6b4ce701
)

add_revision(gdal
  URL "http://download.osgeo.org/gdal/gdal-1.9.2.tar.gz"
  URL_MD5 3f39db89f4710269b3a8bf94178e07aa
)

# NOTE: if updating laszip version, fix patch in laszip.cmake
add_revision(laszip
  URL "http://download.osgeo.org/laszip/laszip-2.1.0.tar.gz"
  URL_MD5 3dfc230b3cee2197ebf88656fad18428
)

# NOTE: if updating libgeotiff version, fix patch in libgeotiff.cmake
add_revision(libgeotiff
  URL "http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-1.4.0.tar.gz"
  URL_MD5 efa7b418bc00228fcda4da63557e40c2
)

add_revision(liblas
  GIT_REPOSITORY "https://github.com/libLAS/libLAS.git"
  GIT_TAG 1.7.0
)

add_revision(libxml2
  GIT_REPOSITORY "git://git.gnome.org/libxml2"
  GIT_TAG v2.9.1
)

add_revision(pcl
  GIT_REPOSITORY "https://github.com/PointCloudLibrary/pcl.git"
  GIT_TAG master
)

add_revision(pdal
  GIT_REPOSITORY "https://github.com/chambbj/PDAL.git"
  GIT_TAG development
)

# NOTE: if updating proj version, fix patch in proj.cmake
add_revision(proj
  URL "http://download.osgeo.org/proj/proj-4.8.0.tar.gz"
  URL_MD5 d815838c92a29179298c126effbb1537
)

add_revision(qhull
  URL "http://www.qhull.org/download/qhull-2012.1-src.tgz"
  URL_MD5 d0f978c0d8dfb2e919caefa56ea2953c
)

add_revision(tiff
  URL "http://download.osgeo.org/libtiff/tiff-4.0.3.tar.gz"
  URL_MD5 051c1068e6a0627f461948c365290410
)

add_revision(xercesc
  URL "http://mirrors.gigenet.com/apache//xerces/c/3/sources/xerces-c-3.1.1.tar.gz"
  URL_MD5 6a8ec45d83c8cfb1584c5a5345cb51ae
)

# NOTE: if updating zlib version, fix patch in zlib.cmake
add_revision(zlib
  URL "http://zlib.net/zlib-1.2.8.tar.gz"
  URL_MD5 44d667c142d7cda120332623eab69f40
)
