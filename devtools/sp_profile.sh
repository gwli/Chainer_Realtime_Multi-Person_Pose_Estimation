sp="/raid/tools/SP/SystemProfiler-linux-public-3.9.3747-52a8955/Target-x86_64/x86_64/sp"
cmd="python3 train_coco_pose_estimation.py --gpu=0"
cd ..
rm -fr ./*.qdstrm
$sp profile --delay=10 --duration=10 -o hoomd_blue.qdstrm -t cuda,cublas,curand,pthread,cudnn $cmd
