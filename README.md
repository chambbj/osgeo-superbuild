This is an __unofficial__ OSGEO Superbuild (because I'm not a fan of installers and a bit distrustful of other people's binaries). It is inspired by and borrows heavily from the ParaView Superbuild.

Libraries (mostly OSGeo, but not entirely) that have been at least minimally tested on both Windows 7 and/or Mac OS X (Lion) are:

* Boost 1.53
* Eigen 3.1.2
* FLANN 1.8.4
* GDAL 1.9.2
* LASzip 2.1.0
* libgeotiff 1.4.0
* libLAS 1.7.0
* libxml2 2.9.1
* PCL master
* PDAL master
* Proj4 4.8.0
* QHull 2012.1
* libtiff 4.0.3
* xercesc 3.1.1
* zlib 1.2.8

### Getting osgeo-superbuild

To get the superbuild:

```
git clone https://github.com/chambbj/osgeo-superbuild.git
```

### Configuring osgeo-superbuild

This assumes a working knowledge of CMake and its supported generators (feel free to use the GUI or command-line), as well as your platform's compiler.

Change into the working directory:

```
cd osgeo-superbuild
```

As a minimal example of an out of source build (libtiff in this case), do the following:

```
mkdir build
cd build
cmake -DENABLE_tiff=ON ..
```

### Compiling osgeo-superbuild

Continuing with our example, compile and install the libraries:

```
make
make install
```

__Note that there are a few libraries that only provide makefiles for Windows users (typically, makefile.vc). Because you can build both Visual Studio solutions and NMake Makefiles from the command line, it is generally easier to always use NMake from the MSVC command-line to compile the superbuild, rather than using the MSVC IDE.__
