#delete CUR reports older than 8 days
find /home/c4t_appserver/instance/reports/CUR/ -mindepth 2 -mtime +8 -delete
#delete EQ reports older than 8 days
find /home/c4t_appserver/instance/reports/EQ/ -mindepth 2 -mtime +8 -delete
#delete FO reports older than 8 days
find /home/c4t_appserver/instance/reports/FO/ -mindepth 2 -mtime +8 -delete
#delete FO dumps older than 8 days
find /home/c4t_appserver/instance/dumps/FO/fo/ -mindepth 2 -mtime +8 -delete
#Clear main report dir
find /home/reports/ -mindepth 2 -mtime +8 -delete
