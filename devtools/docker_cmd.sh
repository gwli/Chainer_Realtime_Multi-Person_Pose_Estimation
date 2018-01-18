tag=nvdevtools/chainer:pip-cuda-8.0

nvidia-docker run --privileged=true  -e DISPLAY  --net=host --ipc=host -it --rm  -p 7022:22 -p 5022:5022 \
     -v $HOME/.Xautority:/home/nvidia/.Xautoority \
     -v /raid/dl_samples:/raid/dl_samples \
     -v /raid/tools:/raid/tools \
     -v /raid/dldata/chainer_coco2017:`pwd`/../coco 
     -w `pwd`  \
     $tag /bin/bash

