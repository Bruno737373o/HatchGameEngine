# Configurações do ecossistema Android para a engine

# Adiciona definições globais para compilação Android
add_compile_definitions(HATCH_ANDROID __ANDROID__)

# Procura as bibliotecas nativas essenciais do Android (Log, OpenGL ES, EGL)
find_library(LOG_LIB log)
find_library(GLESv2_LIB GLESv2)
find_library(GLESv3_LIB GLESv3)
find_library(EGL_LIB EGL)
find_library(ANDROID_LIB android)

# Define as bibliotecas do sistema Android necessárias para o link final
set(PLATFORM_LIBS
    ${LOG_LIB}
    ${GLESv3_LIB}
    ${EGL_LIB}
    ${ANDROID_LIB}
)

# Adiciona as bibliotecas aos alvos principais da engine
# (Ajuste "HatchGameEngine" se o nome do target principal no CMakeLists.txt for diferente)
if(TARGET HatchGameEngine)
    target_link_libraries(HatchGameEngine PRIVATE ${PLATFORM_LIBS})
endif()

