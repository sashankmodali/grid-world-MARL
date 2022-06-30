#!/bin/bash
variable=$(conda info | grep -i 'base environment' | awk '{ print $4 }')
source ${variable}/etc/profile.d/conda.sh
conda activate deep-learning
python main.py --algo saddle_point --summary_dir simulation_results/saddle_point --n_episodes 10000 