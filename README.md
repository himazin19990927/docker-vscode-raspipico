# docker-vscode-raspipico

## ビルド方法
buildディレクトリに`.uf2`ファイルが生成される。
```console
mkdir build
cd build
cmake ..
make
```

## プロジェクト名の変更
`CMakeLists.txt`内の`project`からプロジェクト名を変更できる。
```cmake
# sample_projectから新しいプロジェクト名に変更する
project(sample_project C CXX ASM) 
```
