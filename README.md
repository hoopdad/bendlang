# Experimenting with Bend

## About Bend

Bend is a high level language like python that easily runs on CPUs or GPUs, without the configuration needed on specialized GPU compilers. Thanks to my friend and colleague Gus for introducing me to it.

## Install

I am running this through WSL2 on Windows 11, on a laptop with an Intel i5 processor and an NVidia RTX-2050 graphics card. It is likely that other platforms have similar but different installation procedures and different hardware configurations give different results.

 - Install the NVIDIA CUDA toolkit. Reference [NVidia's CUDA site](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local) 
```
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.5.0/local_installers/cuda-repo-wsl-ubuntu-12-5-local_12.5.0-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-12-5-local_12.5.0-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-12-5-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit nsight-compute nsight-systems nvidia-cuda-toolkit
export PATH="/usr/local/cuda-12.5/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-12.5/lib64:$LD_LIBRARY_PATH"
nvcc --version
```
That finally `nvcc` line is a validation that the c compiler is installed.

 - Install Rust. Make sure to pick Nightly as default toolchain, which is an option if you go through a customized isntall.

```
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
. $HOME/.cargo/env
```

 - Install the Rust modules from HigherOrderCO
```
cargo +nightly install hvm
cargo +nightly install bend-lang
```

## Run Examples

I copied one of the examples from Bend Lang's repo and scripted it to run 3 different ways, with timings. Run 
```
./bendrun.sh
```
### Recording 5/22

Watch my demo video to see it run with my resources monitor open. ([bend_demo_parallelism.mp4](https://github.com/hoopdad/bendlang/raw/main/bend_demo_parallelism.mp4))

## Results 5/22

Here's the output of 5/22/2024 using version 11.5 of NVIDIA Cuda Compiler
```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2021 NVIDIA Corporation
Built on Thu_Nov_18_09:45:30_PST_2021
Cuda compilation tools, release 11.5, V11.5.119
Build cuda_11.5.r11.5/compiler.30672275_0
starting CPU single thread run
Result: 16515072
time to run: 52897
starting CPU multi thread run
Result: 16515072
time to run: 8641
starting GPU multi thread run
Result: 16515072
time to run: 29694
```

## Results 5/23

Here's the output of 5/23/2024 using version 12.5 of NVIDIA Cuda Compiler
```txt
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2024 NVIDIA Corporation
Built on Wed_Apr_17_19:19:55_PDT_2024
Cuda compilation tools, release 12.5, V12.5.40
Build cuda_12.5.r12.5/compiler.34177558_0
starting CPU single thread run
Result: 16515072
time to run: 62271
starting CPU multi thread run
Result: 16515072
time to run: 18225
starting GPU multi thread run
Result: 16515072
time to run: 29140
```


## Cleanup

To remove all the resources
```
rustup self uninstall
sudo apt-get -y remove nvidia-cuda-toolkit nsight-compute-2024.1.1 nsight-systems-2024.2.3 cuda-toolkit 
sudo apt-get -y autoremove
```

## References

- Higher Order - creator of Bend: https://github.com/HigherOrderCO/bend
