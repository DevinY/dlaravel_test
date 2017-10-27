# DLaravel 功能測試工具 Beta

為了強化D-Laravel每一版本釋出的穩定性，加了一個簡易的測試公具，對D-Laravel進行想關功能測試。

這個工具會在測試的dlaravel目錄的sites資料夾建立及刪除Project，請務使用在正式的D-Laravel環境。

可透過docker-compose.yml掛載要測試的D-Laravel資料夾。

基本使用方式:

一、啟動Docker In Docker，服務名稱為dind

docker-compose up -d

二、執行測試指令
./run_test.sh
