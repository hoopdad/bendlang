# Experimenting with Bend

## Install

I am running this through WSL on Windows 11 
 - Install the NVIDIA CUDA toolkit. I had issues with the latest isntaller from [NVidia's CUDA site](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local) but this one seems to function, even if it might not be the most performant.
```
sudo apt-get -y install cuda-toolkit
```
Also tried 5/22/2024:
```
sudo apt-get -y install nvidia-cuda-toolkit
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

## Problems Running

I often see the below, though I have had some successful runs as the video shows. It seems the versions and sequence of installs is critical.

```
Errors:
Error reading result from hvm. Output :
Failed to launch kernels (error code the provided PTX was compiled with an unsupported toolchain.)!
exit status: 1
```

I do not have a solution for the above other than to uninstall everything and re-install. (Though even that is not 100% for some reason - I must be skipping some step sometimes.)

## Cleanup

To remove all the resources
```
rustup self uninstall
sudo apt-get -y remove cuda-toolkit
```
