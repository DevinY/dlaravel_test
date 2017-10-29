#!/bin/bash
source bash_colors
set -e
echo -e "${BRed}進入${BGreen}D-Laravel${BRed}資料夾${Color_Off}"
cd dlaravel

Msg="初始化環境 Init"
echo -e "${Bred}${Msg}${Bcolor_Off}"
if [ -e ".env" ];then
rm docker-compose.yml
fi
if [ -e ".env" ];then
rm .env
fi
rm -rf data

Msg="移除測試專案..(Removing test project)"
echo -e "${Bred}${Msg}${Bcolor_Off}"

if [ -e "sites/first_project" ];then
rm -rf sites/first_project
fi
if [ -e "sites/second_project" ];then
rm -rf sites/second_project
fi

test_case=( "./console version" 
            "./console up" 
            "./create first_project"
            "./console top" 
            "./console top db" 
            "./console ps"
            "./console random"
            "./console info"
            "./console normal"
            "cd sites/first_project"
            )
for i in "${test_case[@]}"
do
    :
    echo $i
    Msg="Run:"
    MsgCommand=${i}
    echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
    ${MsgCommand}
done

Msg="Run:"
MsgCommand="php artisan migrate"
echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
docker-compose -f ../../docker-compose.yml exec -u dlaravel php php $(basename ${PWD})/artisan migrate

Msg="Run:"
MsgCommand="phpunit"
echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
docker-compose -f ../../docker-compose.yml exec -u dlaravel php first_project/vendor/bin/phpunit -c $(basename ${PWD})/phpunit.xml

Msg="Run:"
MsgCommand="cd ../.."
echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
${MsgCommand}


Msg="Run:"
MsgCommand="./console down"
echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
${MsgCommand}


echo -e "${BPurple}測試.env環境加入redis服務${Color_Off}"

Msg="Run:"
MsgCommand="cp .env.example .env"
echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
${MsgCommand}

echo -e "${BPurple}移除.env中的MYSQL_ROOT密碼${Color_Off}"
sed -i '/MYSQL_ROOT_PASSWORD/d' ./.env



Msg="Run:"
MsgCommand="cat .env"
echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
${MsgCommand}

#使用.env時的測試
test_case=( "./console down" 
            "./console up" 
            "./create second_project"
            "./console top" 
            "./console top db" 
            "./console ps"
            "./console custom"
            "./console info"
            "cd sites/second_project"
            )
for i in "${test_case[@]}"
do
    :
    echo $i
    Msg="Run:"
    MsgCommand=${i}
    echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
    ${MsgCommand}
done

Msg="Run:"
MsgCommand="php artisan migrate"
echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
docker-compose -f ../../docker-compose.yml exec -u dlaravel php php $(basename ${PWD})/artisan migrate

Msg="Run:"
MsgCommand="phpunit"
echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
docker-compose -f ../../docker-compose.yml exec -u dlaravel php second_project/vendor/bin/phpunit -c $(basename ${PWD})/phpunit.xml

echo -e "${BPurple}回Project資料夾${Color_Off}"
cd ../..

Msg="Run:"
MsgCommand="./console supervisor up"
echo -e "${BRed}${Msg}${Bcolor_Off}${BGreen}${MsgCommand}${Color_Off}"
${MsgCommand}

./console down

echo -e "${BGreen}Finish${Color_Off}"
