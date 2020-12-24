# SFTP
*Sftp是Secure File Transfer Protocol的縮寫，安全文件傳送協議。可以為傳輸文件提供一種安全的加密方法。sftp與ftp 有著幾乎一樣的語法和功能。SFTP為SSH的一部分。*
**以下介紹2種連線工具 : FileZila & VsCode-SFTP**
## 老牌FTP軟體 - [FileZila <i class="fa fa-external-link"></i>](https://filezilla-project.org/download.php?type=client)
* 一般設定
    * 協定：`SFTP-SSH File Transfer Protocol`
    * 主機：`140.123.123.111.143`
    * 連接埠：請看[🔌埠號映射內容說明](/H1mvrNuNRkKtmyri2LQbhw#🔌埠號映射內容說明)，==與ssh一樣，對應到`port-22`的==
    * 使用者：`root`
    * 密碼：您表單所提供密碼
* 進階設定
    * 預設開啟目錄
        * 預設本地目錄
        * 預設遠端目錄
    * - [ ] 目錄比對：比對本地與遠端的目錄差別

{%youtube 6njnV8n0uig %}
## [VsCode <i class="fa fa-external-link"></i>](https://code.visualstudio.com/download) - [SFTP plugin <i class="fa fa-external-link"></i>](https://marketplace.visualstudio.com/items?itemName=liximomo.sftp)

1. 安裝[SFTP 套件 <i class="fa fa-external-link"></i>](https://marketplace.visualstudio.com/items?itemName=liximomo.sftp)
2. 設定同步資料夾
3. 設定ip, port
4. 每次輸入開啟vscode需要輸入密碼
5. <kbd>Ctrl</kbd>+<kbd>S</kbd>儲存即可同步資料

{%youtube YH2kQ8kncrw %}


###### tags: `DgxGuide` `guide`