set(FWBUILDER_XML_VERSION 24)

set(PROJECT_VERSION_MAJOR "6")
set(PROJECT_VERSION_MINOR "0")
set(PROJECT_VERSION_PATCH "0")
set(PROJECT_VERSION_EXTRA "-beta")
set(PROJECT_GENERATION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}")
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}${PROJECT_VERSION_EXTRA}")

## Git revision number ##
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/.git")
  execute_process(COMMAND git describe --tags HEAD
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    OUTPUT_VARIABLE GIT_DESCRIBE_TAGS ERROR_QUIET)
  if(GIT_DESCRIBE_TAGS)
    string(REGEX REPLACE "^v(.*)" "\\1" GIT_REVISION "${GIT_DESCRIBE_TAGS}")
    string(STRIP "${GIT_REVISION}" GIT_REVISION)
    if(GIT_REVISION)
      set(PROJECT_VERSION "${GIT_REVISION}")
      string(REGEX REPLACE "^([0-9]+\\.[0-9]+).*" "\\1" PROJECT_GENERATION "${GIT_REVISION}")
      string(STRIP "${PROJECT_GENERATION}" PROJECT_GENERATION)
    endif(GIT_REVISION)
  endif(GIT_DESCRIBE_TAGS)
endif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/.git")

