#!/bin/bash
# sh scripts/c_ood/14_mnist_train_sem.sh

GPU=1
CPU=1
node=79
jobname=openood

PYTHONPATH='.':$PYTHONPATH \
srun -p dsta --mpi=pmi2 --gres=gpu:${GPU} -n1 \
--cpus-per-task=${CPU} --ntasks-per-node=${GPU} \
--kill-on-bad-exit=1 --job-name=${jobname} \
-w SG-IDC1-10-51-2-${node} \
python main.py \
--config configs/datasets/digits/mnist.yml \
configs/datasets/digits/mnist_fsood.yml \
configs/networks/lenet.yml \
configs/pipelines/train/train_sem.yml \
--network.checkpoint ./results/mnist_0408_3/mnist_lenet_base_e100_lr0.1/best_epoch77_acc0.9940.ckpt \
--num_workers 8
