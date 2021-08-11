---
title: 'Linux with Tensorflow in MSI GL65 (with RTX2070)'
subtitle: 'All the necessary steps for a Deep Learning prototyping station'
summary: I recently changed my laptop. I thought a long journey awaited for me making this relatively new laptop work with Linux. To my surprise, it wasn't too difficult. Props on MSI for making Linux-friendly hardware! Here are the steps to install the graphics driver and get this laptop running Tensorflow 2 on the RTX2070 card. 
authors:
- admin
date: "2016-04-20T00:00:00Z"
lastmod: "2019-04-17T00:00:00Z"
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Placement options: 1 = Full column width, 2 = Out-set, 3 = Screen-width
# Focal point options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
image:
  placement: 2
  caption: 'Image credit: msi.com'
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

I have been a linux user for a few years now.

I have also been interested in playing games in my computer (although being a gamer nowadays feels like a full-time job, so I don't consider myself a hardcore gamer).

I often run a dual boot system, doing most of my daily chores on Linux, and playing during the weekends on my MS Windows partition.

To my surprise, installing a linux partition in this particular laptop was straightforward. No special settings on the bootloader, no special proprietary drivers for my WiFi. It just worked out of the box after I booted and installed a live usb flash drive.

Of course, the proprietary graphics driver, CUDA, and cuDNN have to be installed independently after the fresh OS install if you are interested in using the graphics card to train some deep learning models.

Those components are what I will be covering in this post.

I will also be assuming that you are running an Ubuntu 20.04 distro. 

The steps should be fairly similar for other Debian-based distros.

## Installing proprietary NVIDIA drivers

You have a few options for installing the graphic drivers. If you don't feel like modding your default OS too much, I recommend you to simply install them from the `Additional Drivers` tab in your `Software & Updates` menu in Ubuntu.

Launch the `Activities` menu and type `Additional Drivers`

You should see the option for your NVIDIA RTX2070 there.

Install the latest version available and tested.

In my case, and at the time of this writing, that is `nvidia-driver-450`.

## Installing CUDA

Tensorflow works with CUDA v10.1.

The CUDA toolkit for v10.1 can be found in the package manager.

```bash
sudo apt-get install nvidia-cuda-toolkit
```

Check the version
```bash
$ nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2019 NVIDIA Corporation
Built on Sun_Jul_28_19:07:16_PDT_2019
Cuda compilation tools, release 10.1, V10.1.243
```

If you are in `v10.1`, you are good to go.

## Installing cuDNN

Tensorflow requires cuDNN v7.6.

You can obtain the library either as a `.deb` package or by downloading the zipped `.so` libraries.

At the time of this writing, the `.deb` package is only available for Ubuntu <=18.04 and the folder structure differs from the folder structure of my cuda library installed from the package manager.

I suggest downloading the `.so` libraries.

You can either download the zipped files of [v7.6.5](https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.1_20191031/cudnn-10.1-linux-x64-v7.6.5.32.tgz), or browse the [archive](https://developer.nvidia.com/rdp/cudnn-archive).

> Note that you need to make an account to download these zipped files from NVIDIA

Uncompress the file somewhere in your file system

```bash
$ tar xvf cudnn-10.1-linux-x64-v7.6.5.32.tgz 
```

That should generate a folder named `cuda` wherever you uncompressed it.

For your convenience, make a variable `CUDNNDIR` that points to wherever place you uncompressed the file in.

In my case, I uncompressed inside my `Download` folder, so this is how it looks

```bash
$ CUDNNDIR=~/Downloads/cuda
```

This is the structure of my uncompressed file
```bash
$ tree $CUDNNDIR

.
├── include
│   └── cudnn.h
├── lib64
│   ├── libcudnn.so -> libcudnn.so.7
│   ├── libcudnn.so.7 -> libcudnn.so.7.6.5
│   ├── libcudnn.so.7.6.5
│   └── libcudnn_static.a
└── NVIDIA_SLA_cuDNN_Support.txt
```

In my Ubuntu 20.04 and using the `nvidia-cuda-toolkit` package from aptitude, the library is installed here:

```bash
CUDADIR=/lib/cuda
```

I also suggest making a variable that points to that place. Replace `/lib/cuda` with your location if that's not where the library was installed.

The structure of my `CUDADIR`:
```bash
$ tree $CUDADIR

/lib/cuda
├── bin
├── include
├── lib64
├── nvvm
│   └── libdevice -> ../../nvidia-cuda-toolkit/libdevice
└── version.txt
```

The `CUDADIR` is where we need to install the `cuDNN` library. 

Installing, in this context, is basically copying the headers and shared library. Then, making these files available to external libraries like tensorflow. 

Copy the headers
```bash
sudo cp ${CUDNNDIR}/include/*.h ${CUDADIR}/include/
```

Copy the shared libraries
```bash
sudo cp ${CUDNNDIR}/lib64/libcudnn* ${CUDADIR}/lib64
```

The file structure of the CUDA library should look something like this now
```bash
/lib/cuda
├── bin
├── include
│   └── cudnn.h
├── lib64
│   ├── libcudnn.so
│   ├── libcudnn.so.7
│   ├── libcudnn.so.7.6.5
│   └── libcudnn_static.a
├── nvvm
│   └── libdevice -> ../../nvidia-cuda-toolkit/libdevice
└── version.txt
```

Change permissions to the recently copied files
```bash
sudo chmod a+r ${CUDADIR}/include/cudnn*.h ${CUDADIR}/lib64/libcudnn*
```

That installed cuDNN in your system.

At least in my case, these files are still not reachable by tensorflow. You can achieve that by exporting the path to your `LD_LIBRARY_PATH` variable.
```bash
export LD_LIBRARY_PATH=${CUDADIR}/lib64:$LD_LIBRARY_PATH
```

Now check whether tensorflow 2 is able to see your gpu
```python
$ python3
Python 3.8.5 (default, Jul 28 2020, 12:59:40) 
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import tensorflow as tf
>>> tf.config.list_physical_devices('GPU') 
[PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]
```

If you get a non-empty list as the result of `list_physical_devices('GPU')`, that should be a good indicator.

The `export` instruction is not persistent and the changes will be lost after you close your terminal.

Make it permanent by adding it to your `~/.bashrc` file.

Putting new statements at the end of the file is usually the best practice.

When you do that, spell the `$CUDADIR` folder as an absolute path, do not use the `$CUDADIR` variable.

You should be all set. Try training something and check the console to corroborate it is doing it through your RTX2070.

Cheers.
