#archive CUR logs older than 2 days
cd /home/c4t_appserver/instance/Check4Trick/Server/binCUR/server_logs/
find . -maxdepth 1 -type f -mtime +2 -exec sh -c 'tar cfz "{}".tar.gz {}; mv "{}".tar.gz /home/c4t_appserver/instance/Check4Trick/Server/binCUR/server_logs/Archive; rm {}' \;
#archive EQ logs older than 2 days
cd /home/c4t_appserver/instance/Check4Trick/Server/binEQ/server_logs/
find . -maxdepth 1 -type f -mtime +2 -exec sh -c 'tar cfz "{}".tar.gz {}; mv "{}".tar.gz /home/c4t_appserver/instance/Check4Trick/Server/binEQ/server_logs/Archive; rm {}' \;
#archive FO logs older than 2 days
cd /home/c4t_appserver/instance/Check4Trick/Server/binFO/server_logs/
find . -maxdepth 1 -type f -mtime +2 -exec sh -c 'tar cfz "{}".tar.gz {}; mv "{}".tar.gz /home/c4t_appserver/instance/Check4Trick/Server/binFO/server_logs/Archive; rm {}' \;

#clear apache logs older than 2 days
find /home/c4t_appserver/instance/Apache_logs -mindepth 1 -mtime +2 -delete