#!/bin/bash
# sh scripts/_get_started/6_mnist_test_fsood_mds.sh

GPU=1
CPU=1
node=30
jobname=openood

PYTHONPATH='.':$PYTHONPATH \

python main.py \
--config configs/datasets/digits/MV.yml \
configs/networks/wide_resnet_50_2.yml \
configs/pipelines/test/test_patchcore.yml \
configs/postprocessors/patch.yml \
--num_workers 4