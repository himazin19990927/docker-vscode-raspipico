cmake_minimum_required(VERSION 3.12)

# SDKの検索スクリプトをインクルード
include(pico_sdk_import.cmake)
include(pico_extras_import.cmake)

# プロジェクトの基本設定
project(sample_project C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# SDKの初期化
pico_sdk_init()

# ソースコードの追加
add_executable(PROJECT_NAME
    src/main.cpp
)

# SDKのライブラリをリンク
target_link_libraries(PROJECT_NAME pico_stdlib)

# 追加出力ファイルを設定
pico_add_extra_outputs(PROJECT_NAME)
