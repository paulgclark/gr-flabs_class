find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_FLABS_CLASS gnuradio-flabs_class)

FIND_PATH(
    GR_FLABS_CLASS_INCLUDE_DIRS
    NAMES gnuradio/flabs_class/api.h
    HINTS $ENV{FLABS_CLASS_DIR}/include
        ${PC_FLABS_CLASS_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_FLABS_CLASS_LIBRARIES
    NAMES gnuradio-flabs_class
    HINTS $ENV{FLABS_CLASS_DIR}/lib
        ${PC_FLABS_CLASS_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-flabs_classTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_FLABS_CLASS DEFAULT_MSG GR_FLABS_CLASS_LIBRARIES GR_FLABS_CLASS_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_FLABS_CLASS_LIBRARIES GR_FLABS_CLASS_INCLUDE_DIRS)
