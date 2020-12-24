# Docker

*Containers as a Service ( CaaS ) - 容器如同服務*

**Docker**是個高效率、輕量、秒開級的虛擬環境，是目前在開發環境不統一的問題上的最佳解。目前擁有龐大且活躍的社群。架設想要的Service如同呼吸一樣容易，Nvidia也提供各種以==配置好的開發環境(互相對應好的Library)==，只需==引用[NGC]上的Image==，即可進行開發。

http://140.123.111.143:8080/ 就是利用Docker架設==Nginx==伺服器，在加上==HackMD==編輯好的筆記下載成HTML檔案所完成。

:::spoiler 🤔
<br>

* 小明(~~回到台灣後~~)想要開發一個Project，他在網路上尋找範例
他看到一個範例是用![][Ubuntu]Ubuntu的環境，可是他用的是![][Windows10]Win10
他不需要裝![][Ubuntu]Ubuntu的虛擬機，只需要安裝![][Docker]Docker
再到DockerHub上面找到![][Ubuntu]Ubuntu的官方鏡像
下載後執行就可以開始使用Ubuntu![][Ubuntu]的開發環境。
* 小明買了一台Dgx Station(~~有錢人的快樂就是這麼樸實無華~~)，也用Docker來配置開發環境，
他去![][NGC]Nvidia-GPU-Cloud上下載配置好的![][Tensorflow]Tensorflow環境，
一樣下載執行後就可以直接開始快樂的開發(~~肝他的模型~~)
不用自己配置GPU驅動程式、cuDNN環境變數、Cuda開發套件(~~那是窮人才這樣幹~~)
* 小明之後他又想用Nginx架教學網站，同樣的操作；在DockerHub找到Nginx的官方鏡像
在啟動時稍微設定一下Nginx的對應埠號，就完成了伺服器的基本架設。

:::
[Ubuntu]: https://i.imgur.com/wtHpswI.png
[Windows10]: https://i.imgur.com/Iurnb98.jpg
[Docker]: https://i.imgur.com/fRrDMip.png
[NGC]: https://i.imgur.com/3jURCm3.png
[Tensorflow]: https://i.imgur.com/bQP2q59.png



## Container vs. VM
* Container 比 VM 更輕量：不用Hypervisor、不必額外安裝 Guest OS，直接共同分享本機的 Kernel。所以比傳統 VM 更省資源、更快速，效能接近原生主機

![](https://i.imgur.com/QARCIFX.png)

VM虛擬化是實作在==硬體層之上==，為了建立可以執行整套作業系統的sandbox

Container是實作在==作業系統層之上==，將應用程式所需的程式碼、函式庫、環境配置檔都打包，而建立的sandbox。

簡而言之，VM打包作業系統，Container打包應用程式。
:::spoiler 🤔
**簡而言之**
**VM** ==用軟體模擬硬體==，就要包含所有東西，還要另裝作業系統(不能用GPU，要可以用得很貴)
**Docker** ==用軟體模擬作業系統==，只需要留下重要或特殊的東西，硬體資源直接可映射到本機(可以用GPU)
**你覺得誰快😋**
:::
## Docker Conponents
[![](https://i.imgur.com/gZZ9MWp.png)](https://i.imgur.com/gZZ9MWp.png "點圖放大")

**主要包含三部分：**
### 1. Docker **Image** (映像檔)
:::info
**==唯獨的環境模板==，涵蓋Container內的所有程式(包括應用程式、函式庫、環境設定檔)，==用來建立Docker Container==**
:::
### 2. Docker **Container** (容器)
:::info
**==Container==是根據docker image所建立的instance。image是唯讀的，而==container是可寫層==。每個container之間都是互相獨立的平台。<br><br>Container是一個==簡易版的 Linux== 環境應用程式並可在其中運行程式。**
:::

### 3. Docker **Registry** (倉庫)
:::info
**==Registry==就像是GitHub一樣，是一個線上伺服器，儲存各式的Docker repository。Registry分成public和private，如最大的public registry — [Docker Hub]，以及我們主要使用的 — ==[NGC]==。<br><br>==Repository==是一個docker images的集合，包含所有同名不同tag的images，如[nvcr.io/nvidia/tensorflow](https://ngc.nvidia.com/catalog/containers/nvidia:tensorflow/tags)。**

:::
:::spoiler 🤔
**簡單來說:**
小明(~~武漢肺炎開工後~~)想要開發一個Project

他從 ==*Registry*(倉庫)== ==下載(`docker pull`)== 一個他需要的 ==*Image*(映像檔)==
這個***Image***已經配置好許多驅動、開發套件、環境變數，小明只需要下載就可以了
小明用這個***Image***來==啟動(`docker run`)== 一個 ==*Container*(容器)==
他可以使用**SSH、Jupyter、VNC** 等連線程式進行**快速開發**
如果他對***Container***有問題，可以隨時==停止(`docker stop`)==或==刪除(`docker  rm -f`)==
或是==重新啟動(`docker restart`)== 也是可以的
:::

## 總結

目前Nvidia官方推薦使用**Docker**來進行==多人多環境開發==及==Dgx Station管理==，使用Docker在管理上也比較容易。~~對Docker有興趣~~想要接Dgx Station IT人員的同學，可以看這個**IT鐵人賽** — [用30天來介紹和使用 Docker 系列](https://ithelp.ithome.com.tw/users/20103456/ironman/1320) ~~快樂得~~學習Docker。

## 參考資料：
>[Docker 筆記 Part 1 ｜簡介](https://medium.com/@VisonLi/docker-%E5%85%A5%E9%96%80-%E7%AD%86%E8%A8%98-part-1-6e83dec901ac)
>[10個Q&A快速認識Docker](https://www.ithome.com.tw/news/91847)
>[Docker 基本教學](https://github.com/twtrubiks/docker-tutorial)
>[手把手教你安裝、使用 docker 並快速產生 Anaconda 環境 (1)](/rG1iqyEmTJuYH36Z5NOO_g?view)
###### tags: `DgxGuide` `guide` `Docker`
[NGC]: https://ngc.nvidia.com/catalog/containers
[Docker Hub]: https://hub.docker.com/


