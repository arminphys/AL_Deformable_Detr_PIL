#!/bin/bash -l

#SBATCH --gres=gpu:h100_pcie_2g.20gb:2
#SBATCH --time=20-00:00:00
#SBATCH --partition=p.hpcl91
#SBATCH --mem-per-cpu=20G
#SBATCH --ntasks-per-core=2
#SBATCH --output=plates_5000-%j.out
#SBATCH --ntasks=2
#SBATCH --ntasks-per-node=2

cd /fs/pool/pool-lambacher/Cluster_Projects/AL_Deformable_Detr_PIL

mamba activate deformable_detr_pil

python -u main.py --output_dir=logs/DABDETR_ARTIFICIAL_PLATE/R50/plates_5000 --batch_size=4 --epochs=100 --lr_drop=40 --resume=/fs/pool/pool-lambacher/Cluster_Projects/AL-Deformable-DETR/pretrained/Deformable_DETR/r50_deformable_detr-checkpoint.pth  --coco_path=/fs/pool/pool-lambacher/Cluster_Projects/data/plates_5000
