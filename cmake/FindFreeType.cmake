#
# Find the native FREETYPE includes and library
#

# This module defines
# FREETYPE_INCLUDE_DIR, where to find ft2build.h, ftheader.h, ...
# FREETYPE_LIBRARIES, the libraries to link against to use FREETYPE.
# FREETYPE_FOUND, If false, do not try to use FREETYPE.

# also defined, but not for general use are
# FREETYPE_LIBRARY, where to find the FREETYPE library.

FIND_PATH(FREETYPE_INCLUDE_DIR_FT2BUILD ft2build.h)

FIND_PATH(FREETYPE_INCLUDE_DIR_FTHEADER freetype/config/ftheader.h
  /usr/include/freetype2
  /usr/local/include/freetype2
)

FIND_LIBRARY(FREETYPE_LIBRARY freetype)

IF (FREETYPE_LIBRARY)
  IF (FREETYPE_INCLUDE_DIR_FTHEADER AND FREETYPE_INCLUDE_DIR_FT2BUILD)
    SET( FREETYPE_FOUND "YES" )
    SET( FREETYPE_INCLUDE_DIR
      ${FREETYPE_INCLUDE_DIR_FT2BUILD}
      ${FREETYPE_INCLUDE_DIR_FTHEADER} )
    SET( FREETYPE_LIBRARIES ${FREETYPE_LIBRARY} )
  ENDIF (FREETYPE_INCLUDE_DIR_FTHEADER AND FREETYPE_INCLUDE_DIR_FT2BUILD)
ENDIF (FREETYPE_LIBRARY)

IF (FREETYPE_FOUND)
	MESSAGE(STATUS "Found FreeType: ${FREETYPE_LIBRARIES}")
ELSE (FREETYPE_FOUND)
	IF(FREETYPE_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could NOT find FreeType library")
	ENDIF (FREETYPE_FIND_REQUIRED)
ENDIF (FREETYPE_FOUND)

MARK_AS_ADVANCED(
  FREETYPE_INCLUDE_DIR_FT2BUILD
  FREETYPE_INCLUDE_DIR_FTHEADER
  )