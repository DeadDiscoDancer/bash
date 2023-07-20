cd /home/c4t_appserver/instance/Check4Trick/Server/binCUR/server_logs/
find . -maxdepth 1 -type f -mtime +1 -exec sh -c 'tar cfz "{}".tar.gz {}; mv "{}".tar.gz /home/c4t_appserver/instance/Check4Trick/Server/binCUR/server_logs/Archive; rm {}' \;
find /home/c4t_appserver/instance/Check4Trick/Server/binCUR/server_logs/Archive -mindepth 1 -mtime +1 -delete
cd /home/c4t_appserver/instance/Check4Trick/Server/binEQ/server_logs/
find . -maxdepth 1 -type f -mtime +1 -exec sh -c 'tar cfz "{}".tar.gz {}; mv "{}".tar.gz /home/c4t_appserver/instance/Check4Trick/Server/binEQ/server_logs/Archive; rm {}' \;
find /home/c4t_appserver/instance/Check4Trick/Server/binEQ/server_logs/Archive -mindepth 1 -mtime +1 -delete
cd /home/c4t_appserver/instance/Check4Trick/Server/binFO/server_logs/
find . -maxdepth 1 -type f -mtime +1 -exec sh -c 'tar cfz "{}".tar.gz {}; mv "{}".tar.gz /home/c4t_appserver/instance/Check4Trick/Server/binFO/server_logs/Archive; rm {}' \;
find /home/c4t_appserver/instance/Check4Trick/Server/binFO/server_logs/Archive -mindepth 1 -mtime +1 -delete
find /home/c4t_appserver/instance/Apache_logs -mindepth 1 -mtime +1 -delete