docker pull victorgwli/chainer:pip-cuda-8.0

nvidia-docker run --privileged  -e DISPLAY  --net=host --ipc=host -it -v $HOME/.Xauthority:/home/nvidia/.Xauthority  -v `pwd`/..:/home/nvidia/samples/Chainer_realtime_Multi-Persion_Pose_estimation  -v /raid/dldata/chainer_coco2017:/home/nvidia/samples/Chainer_realtime_Multi-Persion_Pose_estimation/coco  victorgwli/chainer:pip-cuda-8.0 /bin/bash
