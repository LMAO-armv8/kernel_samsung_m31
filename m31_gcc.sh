#!/bin/bash
export PATH=$(pwd)/../clang/bin:$PATH
export LD_LIBRARY_PATH="$(pwd)/../clang/lib64:$LD_LIBRARY_PATH"
export CROSS_COMPILE=$(pwd)/../toolchain/bin/aarch64-linux-android- 
export CLANG_TRIPLE=aarch64-linux-gnu-
export LD=ld.lld
export AR=llvm-ar
export NM=llvm-nm
export OBJCOPY=llvm-objcopy
export OBJDUMP=llvm-objdump
export READELF=llvm-readelf
export OBJSIZE=llvm-size
export STRIP=llvm-strip
export LLVM_AR=llvm-ar
export LLVM_DIS=llvm-dis
make clean && make mrproper
export ARCH=arm64
export PLATFORM_VERSION=12
export ANDROID_MAJOR_VERSION=s



make LD=ld.lld ARCH=arm64 KCFLAGS=-w AR=llvm-ar NM=llvm-nm LLVM_NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP=llvm-strip LLVM_AR=llvm-ar LLVM_DIS=llvm-dis CONFIG_SECTION_MISMATCH_WARN_ONLY=y exynos9610-m31nsxx_gcc_defconfig
make LD=ld.lld ARCH=arm64 KCFLAGS=-w AR=llvm-ar NM=llvm-nm LLVM_NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP=llvm-strip LLVM_AR=llvm-ar LLVM_DIS=llvm-dis CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j$(nproc)

rm -rf AIK/Image
rm -rf AIK/dtb
rm -rf AIK/dtbo
cp -r arch/arm64/boot/Image AIK/Image
cp -r arch/arm64/boot/dtb_exynos.img AIK/dtb
cp -r arch/arm64/boot/dtbo_exynos.img AIK/dtbo
cd AIK
rm -rf LMAO_kernel_m31.zip
rm -rf LMAO_kernel_m31s.zip
zip -r9 LMAO_kernel_m31.zip * -x .git README.md *placeholder
cd ..
