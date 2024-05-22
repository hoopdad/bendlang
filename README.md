# Experimenting with Bend

## Install

I am running this through WSL on Windows 11 
 - Install the NVIDIA CUDA toolkit. I had issues with the latest isntaller from [NVidia's CUDA site](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local) but this one seems to function, even if it might not be the most performant.
```
sudo apt-get -y install nvidia-cuda-toolkit
sudo apt-get -y install nsight-compute-2024.1.1 nsight-systems-2024.2.3
```
FYI, using the below is not successuful. Make sure you have the "nvidia-" prefix.
```
sudo apt-get -y install cuda-toolkit
```

Note: I see this error on any of the nvidia or nsight installs:
```
/sbin/ldconfig.real: /usr/lib/wsl/lib/libcuda.so.1 is not a symbolic link
```

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

I copied one of the examples from Bend Lang's repo and scripted it to run 3 different ways, with timings.
Run `./bendrun.sh`

Watch my demo video to see it run with my resources monitor open. (bend_demo_parallelism.mp4)

Here's the output of 5/22/2024:
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

## Some Runtime Problems I have seen

I often see the below, though I have had some successful runs as the video shows. After I got it working I broke it again to try to upgrade nvcc. It seems the versions and sequence of installs is critical and I am adept at getting them out of sync.

```
Errors:
Error reading result from hvm. Output :
Failed to launch kernels (error code the provided PTX was compiled with an unsupported toolchain.)!
exit status: 1
```

I do not have a solution for the above other than to uninstall everything and re-install. 

## Cleanup

To remove all the resources
```
rustup self uninstall
sudo apt-get -y remove nvidia-cuda-toolkit nsight-compute-2024.1.1 nsight-systems-2024.2.3
sudo apt-get -y autoremove
```
