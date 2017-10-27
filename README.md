# DLaravel 功能測試工具 Beta

為了強化D-Laravel每一版本釋出的穩定性，加了一個簡易的測試公具，對D-Laravel進行想關功能測試。

這個工具使用的test.sh會在測試的dlaravel目錄的sites資料夾建立及刪除Project，請勿使用在正式的D-Laravel環境。

可透過docker-compose.yml掛載要測試的D-Laravel資料夾。

如果您要使用D-Laravel，不需下載此工具，這是開發Ｄ-Laravel上線前使用的，哈，因為我發覺Ｄ-Laravel新功更新時，很容易造成side efect。

如果您對這個Docker in Docker環境有興趣，歡迎下載研究，目前這個測試功能非常的初版，有機會時，我會再調整及優化。

基本使用方式:

一、啟動Docker In Docker，服務名稱為dind

docker-compose up -d

二、執行測試指令
./run_test.sh


### 如果要進人dind的執行環境，可以簡單的執行

這裡的image已安裝了dockr-compose了，所以如果要拿來進行其他docker相關的測試也是可以用的。

非root

docker-compose exec -u dlaravel dind bash

如果要使用root身份

docker-compose exec dind bash

