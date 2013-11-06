configure_file(${CMAKE_SOURCE_DIR}/data/wrapper/Wrapper.qml    ${CMAKE_BINARY_DIR}/data/wrapper/Wrapper.qml)
configure_file(${CMAKE_SOURCE_DIR}/data/wrapper/wrapper.conf.in    ${CMAKE_BINARY_DIR}/data/wrapper/wrapper.conf)

install(FILES ${CMAKE_BINARY_DIR}/data/wrapper/Wrapper.qml DESTINATION ${DATA_INSTALL_DIR}/wrapper/)
install(FILES ${CMAKE_BINARY_DIR}/data/wrapper/wrapper.conf DESTINATION ${DATA_INSTALL_DIR}/wrapper/)
