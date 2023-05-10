#!/usr/bin/env bash

# 检查数据集是否存在
if [ ! -f "data/code_alpaca_2k.json" ]; then
    echo "answers.json file not exist"
    exit 0
fi

# 转换数据集
python cover_alpaca2jsonl.py \
    --data_path data/code_alpaca_2k.json \
    --save_path data/code_alpaca_2k.jsonl

if [ $? -ne 0 ]; then
    echo "trans json to jsonl failed"
    exit 0
fi

echo "trans json to jsonl done, file is data/code_alpaca_2k.jsonl"
