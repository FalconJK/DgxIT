# SSH
*Secure Shell（安全外殼協定，簡稱SSH）是一種==加密的網路傳輸協定==，可在不安全的網路中為網路服務提供安全的傳輸環境。SSH通過在網路中建立安全隧道來實現SSH客戶端與伺服器之間的連接。雖然任何網路服務都可以通過SSH實現安全傳輸，SSH==最常見的用途是遠端登入系統==，人們通常利用SSH來 ==傳輸命令行介面和遠端執行命令==*
## ![](https://onion.io/wp-content/uploads/2017/11/Moba-Logo.jpg =30x) 對Server寶具 - [MobaXterm <i class="fa fa-external-link"></i>](https://mobaxterm.mobatek.net/download-home-edition.html)
一款萬能~~許願機~~Telnet軟體 - MobaXterm，Windows終端機連線軟體加強版，支援X11 Server，具有多分頁的介面，支援==SSH、SFTP、VNC==、RDP、telnet、rsh、FTP、XDMCP通訊協定連線，內建X-Window、可以製作巨集、有密碼儲存記憶功能。

以下為SSH使用教學：
### 一、功能介面
:::info
[![](https://i.imgur.com/4HQruO6.gif)](https://i.imgur.com/4HQruO6.gif "點圖放大")
:::
### 二、使用步驟
#### Step1: 新建Session、選擇ssh服務、輸入IP、Port
* Remote host : 140.123.111.143
* Port : 請看email
:::info
[![](https://i.imgur.com/vTAJsRo.png)](https://i.imgur.com/vTAJsRo.png "點圖放大")
:::



#### Step2: 設定使用者
- [x] 請勾選`Specify username`
* Name : 自訂
* Username : root
* Password : 表單中設定的密碼
:::info
[![](https://i.imgur.com/TgRLTNg.gif)](https://i.imgur.com/TgRLTNg.gif "點圖放大")
:::

#### Step3: 進階設定
* Advanced SSH setting
    * Execute command：進入Session後執行指令
        * ex：`pwd; cd /workspace`： 指令用`;`分開
        * - [x] Do not exit after command ends：預設若有填入指令，執行完後登出；勾選後即不立刻登出
* BookMark settings：
    * Session Name : 在Sessions中的命名(預設是`ip([UserName])`)<br>![](https://i.imgur.com/IOQl6sX.png)
:::info
[![](https://i.imgur.com/Dwz2OP4.gif)](https://i.imgur.com/Dwz2OP4.gif "點圖放大")
:::



###### tags: `DgxGuide` `guide`
