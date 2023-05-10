# ChatGLM-6B-With-Lora-Fine-tuning

## 启动 ChatGLM

根据需求启动不同的 demo，编辑对应的文件可实现加载不同的 Lora 模型

```bash
# 启动命令行
python cli_demo.py

# 启动 web ui
python web_demo.py

# 启动 api
python api.py
```

## 训练

目前仅支持 alpaca 数据集

### 使用方法

```bash
# 转换 json 为 jsonl
sh ./1_to_json.sh

# tokenization
sh ./2_tokenize.sh

# 训练
sh ./3_train.sh
```
