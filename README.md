# im2txt_demo
im2txt + pretrained models + docker = easy tryout

This repo contains a copy of im2txt (https://github.com/tensorflow/models/tree/master/im2txt), 
a suitable docker image, pretrained models (https://github.com/tensorflow/models/issues/466) and 
some trivial shell scripts for convenience.

###Getting started:

####Install docker (skipp if already installed)
https://docs.docker.com/engine/installation/

####Clone this repo and pull large files (pretrained models):
```
git clone git@github.com:siavash9000/im2txt_demo.git
git lfs pull
```

####build docker image
```
cd im2txt_demo
make build
```

#####start container
```
make run
```

#####build run_inference (must be perfromed only once)
```
./build_inference.sh
```
#####get caption for image
```
./process_image.sh imgs/bikes.jpg
```
