#!/bin/bash
set -x
data_name=mnist_30

python -m cfl.bin.train \
  --load-pre-weights \
  --data-name $data_name \
  --model-type conv \
  --data-type sigmoid \
  --dist-type pcd \
  --lambda-m 0.5 \
  --use-threshold \
  --d-lr 0.001 \
  --d-beta1 0.9 \
  --g-lr 0.001 \
  --g-beta1 0.9 \
  --num-components 2 \
  --latent-size 20 \
  --gan \
  --cgan \
  --epochs 50 \
  --post-epochs 400

./experiments/$data_name/sample_cgan.sh
