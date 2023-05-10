# ChatGLM-6b 安装

## 安装环境

可以先安装 [miniconda](https://docs.conda.io/en/latest/miniconda.html)，然后使用 conda 创建一个虚拟环境，再在虚拟环境中安装项目所需的依赖。

```bash
# 添加清华的源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
conda config --set show_channel_urls yes

# 从 base 创建 chat-glm
conda create -n chat-glm --clone base

# 或 创建新的 chat-glm 环境
conda create -n chat-glm python=3.10 -y

# 启用 chat-glm 环境
conda activate chat-glm
```

## 下载项目

[项目地址](https://github.com/THUDM/ChatGLM-6B)

```bash
# 下载项目
git clone https://github.com/THUDM/ChatGLM-6B
cd ChatGLM-6B

# 安装依赖
pip install -r requirements.txt

# 下载模型
# 先安装 Git Large File Storage
brew install git-lfs。

# 下载模型，也可以从别处拷贝
git clone https://huggingface.co/THUDM/chatglm-6b --depth 1

```

### Mac 上的 GPU 加速

对于搭载了 Apple Silicon 的 Mac（以及 MacBook），可以使用 MPS 后端来在 GPU 上运行 ChatGLM-6B。需要参考 Apple 的 官方说明 安装 PyTorch-Nightly。

```bash
conda install pytorch torchvision torchaudio -c pytorch-nightly

```

## 运行

### 运行命令行

```bash
python cli_demo.py
```

### 如果是 Mac Apple Silicon

需要修改 `cli_demo.py`中的代码

```python
# 将下面的代为改为
- model = AutoModel.from_pretrained("THUDM/chatglm-6b", trust_remote_code=True).half().cuda()
+ model = AutoModel.from_pretrained("THUDM/chatglm-6b", trust_remote_code=True).half().to('mps')
```

### 运行 WebUI

```bash
python web_demo.py
```

### 如果是 Mac Apple Silicon

需要修改 `cli_demo.py`中的代码

```python
# 将下面的代为改为
- model = AutoModel.from_pretrained("THUDM/chatglm-6b", trust_remote_code=True).half().cuda()
+ model = AutoModel.from_pretrained("THUDM/chatglm-6b", trust_remote_code=True).half().to('mps')
```

### 运行 API

```bash
python api.py
```

### 如果是 Mac Apple Silicon

需要修改 `cli_demo.py`中的代码

```python
# 将下面的代为改为
- model = AutoModel.from_pretrained("THUDM/chatglm-6b", trust_remote_code=True).half().cuda()
+ model = AutoModel.from_pretrained("THUDM/chatglm-6b", trust_remote_code=True).half().to('mps')
```

## 微调

### 基于 P-Tuning v2 的微调

[查看官方文档](https://github.com/THUDM/ChatGLM-6B/blob/main/ptuning/README.md)

### 使用已有的 Lora

```bash
# 从 huggingface 下载 Lora
git clone https://huggingface.co/shibing624/chatglm-6b-belle-zh-lora

# 安装需要的依赖
pip install git+https://github.com/huggingface/peft.git
```

修改对应代码

```python
# web_demo.py
+ from peft import PeftModel

- model = AutoModel.from_pretrained("THUDM/chatglm-6b", trust_remote_code=True).half().to('mps')
- model = model.eval()

+ model = AutoModel.from_pretrained("THUDM/chatglm-6b", trust_remote_code=True)
+ model = PeftModel.from_pretrained(model, "lora/chatglm-6b-belle-zh-lora", trust_remote_code=True)
+ model = model.half().to('mps').eval()

# api.py 和 cli_demo.py 也类似

```
