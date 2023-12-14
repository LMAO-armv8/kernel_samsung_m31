#!/bin/bash
export CC=clang
export CROSS_COMPILE=$PWD/toolchain/gcc/bin/aarch64-none-linux-gnu-
export LD=ld.lld
export CLANG_TRIPLE=toolchain/proton-clang/bin/aarch64-linux-gnu-
export AR=llvm-ar
export NM=llvm-nm
export OBJCOPY=llvm-objcopy
export OBJDUMP=llvm-objdump
export STRIP=llvm-strip
make clean && make distclean

export ARCH=arm64
export PLATFORM_VERSION=12
export ANDROID_MAJOR_VERSION=s

make LD=ld.lld ARCH=arm64 CC=clang KCFLAGS=-w AR=llvm-ar NM=llvm-nm LLVM_NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP=llvm-strip LLVM_AR=llvm-ar LLVM_DIS=llvm-dis CONFIG_SECTION_MISMATCH_WARN_ONLY=y exynos9610-m31nsxx_gcc_defconfig
make LD=ld.lld ARCH=arm64 CC=clang KCFLAGS=-w AR=llvm-ar NM=llvm-nm LLVM_NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP=llvm-strip LLVM_AR=llvm-ar LLVM_DIS=llvm-dis CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j$(nproc)


rm -rf AIK/Image
rm -rf AIK/dtb
rm -rf AIK/dtbo
cp -r arch/arm64/boot/Image AIK/Image
cp -r arch/arm64/boot/dtb_exynos.img AIK/dtb
cp -r arch/arm64/boot/dtbo_exynos.img AIK/dtbo