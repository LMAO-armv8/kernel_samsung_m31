#clone proton clang v12 toolchain
git clone --depth=1 --branch 20210123 https://github.com/kdrag0n/proton-clang.git toolchain/proton-clang

#gcc 12.3 
wget https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
tar -xf arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
mv arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu gcc
mv gcc toolchain
