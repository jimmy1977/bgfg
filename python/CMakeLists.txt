find_program(PYTHON "python3")
set(PACKAGE_VERSION 1.0.0)

# If we found python 
if (PYTHON)
    set(SETUP_PY_IN "${CMAKE_CURRENT_SOURCE_DIR}/setup.py.in")
    set(SETUP_PY    "${CMAKE_CURRENT_BINARY_DIR}/setup.py")
    set(DEPS        "${CMAKE_CURRENT_SOURCE_DIR}/bgfg_seg/__init__.py")  
    set(OUTPUT      "${CMAKE_CURRENT_BINARY_DIR}/build/")
    set(SOURCEDIR   "${CMAKE_CURRENT_SOURCE_DIR}/../bgfg_seg")

    configure_file(${SETUP_PY_IN} ${SETUP_PY})
    add_custom_command(OUTPUT ${OUTPUT}
                       COMMAND ${PYTHON} ${SETUP_PY} build
                       COMMAND ${CMAKE_COMMAND} -E touch ${OUTPUT}
                       DEPENDS ${DEPS})
    add_custom_target(target ALL DEPENDS ${OUTPUT})
    install(CODE "execute_process(COMMAND ${PYTHON} ${SETUP_PY} install)")
endif()