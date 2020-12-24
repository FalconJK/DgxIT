# VNC
*VNC (Virtual Network Computing)，為一種使用 RFB協定的螢幕畫面分享及遠端操作軟體。此軟體藉由網路，可傳送鍵盤與滑鼠的動作及即時的螢幕畫面。VNC與作業系統無關，因此可跨平台使用，例如可用 Windows連線到某 Linux的電腦，反之亦同。甚至在沒有安裝用戶端程式的電腦中，只要有支援 JAVA的瀏覽器，也可使用。*


## ⭐前言
VNC的使用情形只有在使用==Matlab的Image==才會用到，目前還是有許多人在使用Matlab作為深度學習的工具；由於Matlab必須在圖形介面使用，因此Matlab官方為Nvidia製作維護這個Image。

## 🔌連接方式
VNC主要分為兩種方式:
1. VNC Client : `port-5901`
    *  [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/ "官方軟體")
    *  [MobaXterm](https://mobaxterm.mobatek.net/ "對Server寶具")
[![](https://i.imgur.com/OlvNHkG.gif)](https://i.imgur.com/OlvNHkG.gif "點圖放大")
2. noVNC : `port-6080`，瀏覽器
    * [Microsoft Edge](https://www.microsoft.com/en-us/edge "Chrome下載器")
    * [FireFox](https://www.mozilla.org/zh-TW/firefox/new "過氣分頁始祖")
    * [Chrome](https://www.google.com/intl/zh-TW/chrome/ "吃Ram怪物")
[![](https://i.imgur.com/KXOvQb1.gif)](https://i.imgur.com/KXOvQb1.gif "點圖放大")
## 🖥️更改解析度
* ssh 登入後，執行以下指令即可改變解析度：
* `matlab`這個使用者並沒有ssh權限，請使用`su`指令切換到`matlab`
* 解析度可自由設定，將第3行`1920x1080`替換為欲設定之解析度即可
```bash=
root@[ContainerID]:~$ :su matlab
matlab@[ContainerID]:~$ :vncserver -kill :1
matlab@[ContainerID]:~$ :vncserver -geometry 1920x1080 :1
```
:::warning
{%youtube 6YMFN25O_qo %}
注 : 影片中的連線ssh連線方法為利用Linux內建ssh工具進行連線，僅示範用途；一般使用者可參考[SSH](/ursySZdmTOWv5s5Ah509Kg)章節使用MobaXterm連線即可
:::

## ![](https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Matlab_Logo.png/667px-Matlab_Logo.png =30x) 開始使用Matlab
### 🔒登入使用
* 若無中正大學Matlab帳號，請看[![](https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Matlab_Logo.png/667px-Matlab_Logo.png =20x) 國立中正大學 MATLAB & Simulink全校授權版 安裝說明](http://drive.google.com/file/d/1i90iN0Xb9MCatKyQirvQDl2vJNNK-YWh/view?usp=sharing)進行申請
* 第一次使用請點擊桌面![](https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Matlab_Logo.png/667px-Matlab_Logo.png =20x)icon進入，在終端機依次打入資料登入
    * 帳號
    * 密碼
### 🗂 工作資料夾WorkSpace
* 與JupyterLab不同，位置不是<s>`/workspace`</s>，==而是`/home/matlab/Documents/MATLAB`==
* 在上面的工作目錄一樣掛載2個資料夾，可參考[🔌連線到Container](/H1mvrNuNRkKtmyri2LQbhw#🗂-工作資料夾WorkSpace)
###### tags: `DgxGuide` `guide`