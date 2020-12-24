# ![](https://hsusir.org/wp-content/uploads/2017/11/7388996.png =45x) JupyterLab
:::warning
:bulb:相信大家都使用過Jupyter NoteBook，這裡介紹的是Jupyter**Lab**，官方推薦使用:+1:
:::
## 🔜快速介紹
{%slideshare https://www.slideshare.net/mutolisp/jupyter %}
## 🔌連線
**使用==網頁瀏覽器==進行連線**，請在網址列輸入
```
140.123.111.143:[Port]
```
登入後輸入密碼即可開始使用。
:::info
[![](https://i.imgur.com/QRrDnKP.gif)](https://i.imgur.com/QRrDnKP.gif "點圖放大")
:::
## 🗂 工作資料夾WorkSpace
1. Jupyter的根目錄，在`/worksapce`
2. 要讀取ShareDataSet的資料路徑為`/workspace/ShareDataSet/~`
```
root@[ContainerID]:/workspace# tree
.
├── docker-examples
├── [User]
│   ├── File0
│   ├── File1
│   ├── File2
│   └── File3
├── nvidia-examples
├── README.md
└── ShareDataSet
    ├── DataSet0
    │   └── File0
    ├── DataSet1
    │   ├── File0
    │   ├── File1
    │   └── File2
    └── DataSet2
        ├── File0
        ├── File1
        ├── File2
        └── File3

```
## 👉🔢![](https://img.icons8.com/dusk/64/000000/video-card.png =40x) 指定GPU
* 基本上每個人在使用時，以==一人一張GPU==為準，請在程式的開頭加入以下程式碼：
```python=
# 加入此段程式在第一行
import os
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
#0 ->第一張GPU
#1 ->第二張GPU
#2 ->第二張GPU
#3 ->第二張GPU
```
* 在GPU占用情形，請使用`nvtop`指令來看：
:::info
[![](https://i.imgur.com/5ccHjLj.png)](https://i.imgur.com/5ccHjLj.png "點圖放大")
:::
* 若有人占用GPU但並未訓練，請至FB群組：==Dgx Station通報區==來通報

## 🤮Jupyter Notebook水土不服解藥
如果你非常希望使用Jupyter Notebook，==可以將網址列的`lab`改為`tree`==，就可切換成Jupyter Notebook；反之亦然：
:::info
[![](https://i.imgur.com/Egg2ZtR.gif)](https://i.imgur.com/Egg2ZtR.gif "點圖放大")
:::
:::spoiler 不過Jupyter Lab是下一代的Jupyter主力，轉換也不難，用了之後就知道!
[![](https://i.imgur.com/iRdLn6b.gif)](https://sorry.xuty.tk/wangjingze/)
👆堅持使用Jupyter NoteBook 的你👆
:::

## Jupyter使用參考資料
> ⭐JupyterLab 數據分析必備IDE完全指南
> https://zhuanlan.zhihu.com/p/67959768
> 
> 15個好用到爆炸的Jupyter Lab插件 
> https://zhuanlan.zhihu.com/p/101070029
###### tags: `DgxGuide` `guide`

