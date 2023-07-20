###################################
#Директория, где расположена система
c4t_dir="/mnt/check4trick"
###################################

#Контрольная остановка инстанса
docker compose --profile app down
#Бэкап конфигов, т.к. они будут перезаписаны докером при запуске контейнеров
#Конфиг доменной авторизации
cp "$c4t_dir"/instance/Check4Trick/Admin/backend/safran_admin/ldap_groups.yml "$c4t_dir"/instance/Check4Trick/Admin/backend/safran_admin/ldap_groups_bkp.yml
#Конфиги валютного рынка
cp "$c4t_dir"/instance/Check4Trick/Server/binCUR/Config.ini "$c4t_dir"/instance/Check4Trick/Server/binCUR/Config_bkp.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binCUR/Defines.ini "$c4t_dir"/instance/Check4Trick/Server/binCUR/Defines_bkp.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binCUR/config.yml "$c4t_dir"/instance/Check4Trick/Server/binCUR/config_bkp.yml
#Конфиги фондового рынка
cp "$c4t_dir"/instance/Check4Trick/Server/binEQ/Config.ini "$c4t_dir"/instance/Check4Trick/Server/binEQ/Config_bkp.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binEQ/Defines.ini "$c4t_dir"/instance/Check4Trick/Server/binEQ/Defines_bkp.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binEQ/config.yml "$c4t_dir"/instance/Check4Trick/Server/binEQ/config_bkp.yml
#Конфиги срочного рынка
cp "$c4t_dir"/instance/Check4Trick/Server/binFO/Config.ini "$c4t_dir"/instance/Check4Trick/Server/binFO/Config_bkp.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binFO/Defines.ini "$c4t_dir"/instance/Check4Trick/Server/binFO/Defines_bkp.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binFO/config.yml "$c4t_dir"/instance/Check4Trick/Server/binFO/config_bkp.yml
#Запуск миграций
docker compose --profile migrations up -d
#Запуск инстанса
docker compose --profile app up -d
#Восстановление конфигов из бэкапов
#Конфиг доменной авторизации
cp "$c4t_dir"/instance/Check4Trick/Admin/backend/safran_admin/ldap_groups_bkp.yml "$c4t_dir"/instance/Check4Trick/Admin/backend/safran_admin/ldap_groups.yml
#Конфиги валютного рынка
cp "$c4t_dir"/instance/Check4Trick/Server/binCUR/Config_bkp.ini "$c4t_dir"/instance/Check4Trick/Server/binCUR/Config.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binCUR/Defines_bkp.ini "$c4t_dir"/instance/Check4Trick/Server/binCUR/Defines.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binCUR/config_bkp.yml "$c4t_dir"/instance/Check4Trick/Server/binCUR/config.yml
#Конфиги фондового рынка
cp "$c4t_dir"/instance/Check4Trick/Server/binEQ/Config_bkp.ini "$c4t_dir"/instance/Check4Trick/Server/binEQ/Config.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binEQ/Defines_bkp.ini "$c4t_dir"/instance/Check4Trick/Server/binEQ/Defines.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binEQ/config_bkp.yml "$c4t_dir"/instance/Check4Trick/Server/binEQ/config.yml
#Конфиги срочного рынка
cp "$c4t_dir"/instance/Check4Trick/Server/binFO/Config_bkp.ini "$c4t_dir"/instance/Check4Trick/Server/binFO/Config.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binFO/Defines_bkp.ini "$c4t_dir"/instance/Check4Trick/Server/binFO/Defines.ini
cp "$c4t_dir"/instance/Check4Trick/Server/binFO/config_bkp.yml "$c4t_dir"/instance/Check4Trick/Server/binFO/config.yml