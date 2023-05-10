#!/usr/bin/env bash

MAX_STEPS=52000
SAVE_STEPS=1000
LR_2E_2=2e-2
LR_1E_4=1e-4
DATASET_PATH=data/code_alpaca
OUTPUT_DIR=lora/code_alpaca_2k

python finetune.py \
--dataset_path $DATASET_PATH \
--lora_rank 8 \
--per_device_train_batch_size 6 \
--gradient_accumulation_steps 1 \
--max_steps $MAX_STEPS \
--save_steps $SAVE_STEPS \
--save_total_limit 2 \
--learning_rate $LR_1E_4 \
--fp16 \
--remove_unused_columns false \
--logging_steps 50 \
--output_dir $OUTPUT_DIR