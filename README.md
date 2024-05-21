# Experimenting with Bend

## Install

I am running this through WSL on Windows 11 
 - Install the NVIDIA CUDA toolkit. I had issues with the latest isntaller but this one seems to function, even if it might not be the most performant.
```
sudo apt-get -y install cuda-toolkit
```

 - Install Rust. Make sure to take the Nightly distro, which is an option if you go through a customized isntall.

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


## Cleanup

To remove all the resources
```
rustup self uninstall
sudo apt-get -y remove cuda-toolkit
```
