# ChatGLM-6B-With-Lora-Fine-tuning

本项目用来测试 ChatGLM-6B 模型在 Lora 数据集上的效果

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
# 使用前先配置输入和输出文件路径
sh ./1_to_json.sh

# tokenization
# 使用前先配置输入和输出文件路径
sh ./2_tokenize.sh

# 训练
# 使用前先配置参数，输入和输出文件路径
# 如果出现OOM，可以调小 per_device_train_batch_size, 默认 6
sh ./3_train.sh
```

## 训练数据集

- [ChatGLM 中文问答 LoRA 模型 - shibing624/chatglm-6b-belle-zh-lora](https://huggingface.co/shibing624/chatglm-6b-belle-zh-lora)
- [代码编写 - code-alpaca](https://github.com/sahil280114/codealpaca)
