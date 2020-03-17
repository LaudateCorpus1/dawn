include(AddCXXCompilerFlagIfSuppported)

add_cxx_compiler_flag_if_supported("-g" CXX_COVERAGE_FLAGS)
add_cxx_compiler_flag_if_supported("-O0" CXX_COVERAGE_FLAGS)
add_cxx_compiler_flag_if_supported("--coverage" CXX_COVERAGE_FLAGS)
mark_as_advanced(CXX_COVERAGE_FLAGS)
if(NOT "--coverage" IN_LIST CXX_COVERAGE_FLAGS)
  message(FATAL "Compiler does not support --coverage option")
endif()

set(CMAKE_CXX_FLAGS_COVERAGE "${CXX_COVERAGE_FLAGS}"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE
)
set(CMAKE_C_FLAGS_COVERAGE "${CXX_COVERAGE_FLAGS}"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE
)
set(CMAKE_EXE_LINKER_FLAGS_COVERAGE ""
    CACHE STRING "Flags used for linking binaries during coverage builds." FORCE
)
set(CMAKE_SHARED_LINKER_FLAGS_COVERAGE ""
    CACHE STRING "Flags used by the shared libraries linker during coverage builds." FORCE
)

mark_as_advanced(
    CMAKE_CXX_FLAGS_COVERAGE
    CMAKE_C_FLAGS_COVERAGE
    CMAKE_EXE_LINKER_FLAGS_COVERAGE
    CMAKE_SHARED_LINKER_FLAGS_COVERAGE )
