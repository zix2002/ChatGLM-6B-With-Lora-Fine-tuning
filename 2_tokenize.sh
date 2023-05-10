#!/usr/bin/env bash

MAX_SEQ_LENGTH=128

# 标记化数据集
python tokenize_dataset_rows.py \
    --jsonl_path data/code_alpaca_2k.jsonl \
    --save_path data/code_alpaca \
    --max_seq_length $MAX_SEQ_LENGTH

if [ $? -ne 0 ]; then
    echo "data process done, file in ./data"
    exit 0
fi