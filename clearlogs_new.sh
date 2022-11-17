#clear market logs older than 2 days
find /home/safran/safran_instance/Server/binCUR/server_logs/ -mindepth 1 -mtime +2 -delete
find /home/safran/safran_instance/Server/binEQ/server_logs/ -mindepth 1 -mtime +2 -delete
find /home/safran/safran_instance/Server/binFO/server_logs/ -mindepth 1 -mtime +2 -delete
#clear grpc logs older than 2 days
find /home/c4t_appserver/check4trick_prof/Client/grpc/logs -mindepth 1 -mtime +2 -delete
#clear cgate logs older than 2 days
find /home/safran/safran_instance/Server/binFO/log/ -mindepth 1 -mtime +2 -delete
#clear apache logs older than 2 days
find /var/log/httpd -mindepth 1 -mtime +2 -delete
#clear stages older than 10 days
find /home/safran/safran_stage -mindepth 1 -mtime +10 -delete