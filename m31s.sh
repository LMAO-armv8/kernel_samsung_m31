#!/bin/bash

export CC=$(pwd)/../clang/bin/clang CROSS_COMPILE=$(pwd)/../toolchain/bin/aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu-
make clean && make mrproper
export ARCH=arm64
export PLATFORM_VERSION=12
export ANDROID_MAJOR_VERSION=s


make ARCH=arm64 CONFIG_SECTION_MISMATCH_WARN_ONLY=y exynos9610-m31snsxx_defconfig
make ARCH=arm64 CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j16

cp -r arch/arm64/boot/Image AIK/Image
cp -r arch/arm64/boot/dtb_exynos.img AIK/dtb
cp -r arch/arm64/boot/dtbo_exynos.img AIK/dtbo
cd AIK
rm -rf LMAO_kernel_m31s.zip
rm -rf LMAO_kernel_m31.zip
zip -r9 LMAO_kernel_m31s.zip * -x .git README.md *placeholder
cd ..
