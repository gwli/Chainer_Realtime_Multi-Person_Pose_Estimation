# Chainer\_Realtime\_Multi-Person\_Pose\_Estimation


This is an implementation of [Realtime Multi-Person Pose Estimation](https://arxiv.org/abs/1611.08050) with Chainer.
The original project is <a href="https://github.com/ZheC/Realtime_Multi-Person_Pose_Estimation">here</a>.

<a href="README_JP.md">日本語版 README</a>


## Results
<p align="center">
<img src="data/movie_result.gif" width="720">
</p>

<div align="center">
<img src="data/people.png" width="300" height="300">
&nbsp;
<img src="data/people_result.png" width="300" height="300">
</div>

This project is licensed under the terms of the <a href="LICENSE">license</a>.


## Content
1. [Converting caffe model](#convert-caffe-model-to-chainer-model)
2. [Testing](#test-using-the-trained-model)
3. [Training](#train-your-model-from-scratch)

## Requirements

- Python 3.0+
- Chainer 2.0+
- NumPy
- Matplotlib
- OpenCV

## Convert Caffe model to Chainer model
The authors of [the original implementation](https://github.com/ZheC/Realtime_Multi-Person_Pose_Estimation) provide trained caffe model 
which you can use to extract model weights.
Execute the following commands to download the trained model and convert it to npz file:

```
cd models
wget http://posefs1.perception.cs.cmu.edu/OpenPose/models/pose/coco/pose_iter_440000.caffemodel
wget http://posefs1.perception.cs.cmu.edu/OpenPose/models/face/pose_iter_116000.caffemodel
wget http://posefs1.perception.cs.cmu.edu/OpenPose/models/hand/pose_iter_102000.caffemodel
python convert_model.py posenet pose_iter_440000.caffemodel coco_posenet.npz
python convert_model.py facenet pose_iter_116000.caffemodel facenet.npz
python convert_model.py handnet pose_iter_102000.caffemodel handnet.npz
cd ..
```

## Test using the trained model
Execute the following command with the weight parameter file and the image file as arguments for estimating pose.
The resulting image will be saved as `result.png`.

```
python pose_detector.py posenet models/coco_posenet.npz --img data/person.png 
```


If you have a gpu device, use the `--gpu` option.

```
python pose_detector.py posenet models/coco_posenet.npz --img data/person.png --gpu=0
```

<div align="center">
<img src="data/person.png" width="300" height="300">
&nbsp;
<img src="data/person_result.png" width="300" height="300">
</div>

If the `--img` option is omitted, the real-time demonstration mode with the web camera is activated. Quit with the `q` key.


Similarly, execute the following command for face estimation.
The resulting image will be saved as `result.png`.

```
python face_detector.py facenet models/facenet.npz --img data/face.png 
```


<div align="center">
<img src="data/face.png" width="300">
&nbsp;
<img src="data/face_result.png" width="300">
</div>



## Train your model from scratch
This is a full scratch training procedure using COCO 2017 dataset.


### Download COCO 2017 dataset
```
bash getData.sh
```

If you already downloaded the dataset by yourself, please skip this procedure and change coco_dir in `entity.py` to the dataset path that was already downloaded.


### Setup COCO API

```
git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI/
make
python setup.py install
cd ../../
```


### Check data generator
Execute the following command to check randomly generated training images by generator.
Please confirm that you can see the correct PAFs, Heatmaps, and masks on the clipped image.

```
python coco_data_loader.py
```

### Train with COCO dataset
For each 1000 iterations, the recent weight parameters are saved as a weight file `model_iter_1000`.

```
python train_coco_pose_estimation.py --gpu=0
```

### Test using your own trained model

Execute the following command with your own trained weight parameter file and the image file as arguments for inference. The resulting image will be saved as `result.png`.

```
python pose_detector.py posenet model_iter_1000 --img data/person.png 
```




## Related repository
- CVPR'16, [Convolutional Pose Machines](https://github.com/shihenw/convolutional-pose-machines-release).
- CVPR'17, [Realtime Multi-Person Pose Estimation](https://github.com/ZheC/Realtime_Multi-Person_Pose_Estimation).



## Citation
Please cite the original paper in your publications if it helps your research:    

    @InProceedings{cao2017realtime,
      title = {Realtime Multi-Person 2D Pose Estimation using Part Affinity Fields},
      author = {Zhe Cao and Tomas Simon and Shih-En Wei and Yaser Sheikh},
      booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
      year = {2017}
      }



