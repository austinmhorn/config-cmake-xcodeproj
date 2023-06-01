cmake_minimum_required(VERSION 3.15)

project(CMakeProjectTemplate LANGUAGES CXX)

# CMakeProjectTemplate uses C++17 features
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR})

# CMake options
list(APPEND CMAKE_MODULE_PATH 
	${CMAKE_SOURCE_DIR}/cmake)

# Find Python
find_package (Python COMPONENTS Interpreter Development)

if(NOT Python_FOUND)
    message(FATAL_ERROR "Python couldn't be located!")
endif()

message("Python_FOUND:${Python_FOUND}")
message("Python_VERSION:${Python_VERSION}")
message("Python_Development_FOUND:${Python_Development_FOUND}")
message("Python_LIBRARIES:${Python_LIBRARIES}")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)

# Compile target
set(SOURCE_FILES
    "src/main.cpp")

add_executable(CMakeProjectTemplate 
	${SOURCE_FILES})

# Install executable
install(TARGETS CMakeProjectTemplate
        RUNTIME DESTINATION .)

# Install game data
install(DIRECTORY bin/
        DESTINATION .)
