echo "\e[32m===UPDATE.SH STARTED===\e[0m"
echo "\e[33mSet C4T directory (leave blank for /home/c4t_appserver):\e[0m"
read c4tdir
if [[-z "$c4tdir"]]; then
	c4tdir="/home/c4t_appserver"
fi

echo "\e[33mCreate backup? [i]mages,[s]tage, [a]ll, [n]one\e[0m"
read bkp
if [["$bkp" != "n"]]; then
	date=`date +"%Y-%m-%d %T"`
	mkdir -p "$c4tdir"/backup/"$date"
	if [["$bkp" == "s"]] || [["$bkp" == "a"]]; then
		tar -czf "$c4tdir"/backup/"$date"/"$date"_stage.tar.gz "$c4tdir"/c4t_stage --exclude={'*/c4t_stage.zip'}
	fi
	if [["$bkp" == "i"]] || [["$bkp" == "a"]]; then
		docker save deploy_admin -o "$c4tdir"/backup/"$date"/admin.tar
		docker save deploy_server -o "$c4tdir"/backup/"$date"/server.tar
		docker save deploy_migration -o "$c4tdir"/backup/"$date"/migration.tar
		docker save deploy_grpc -o "$c4tdir"/backup/"$date"/grpc.tar
		for f in "$c4tdir"/backup/"$date"/*.tar; do echo "$f" && tar -zcf "$date"_$(basename "$f" .tar).tar.gz "$c4tdir"/backup/"$date"/"$f" && rm "$f"; done
	fi
	echo "\e[35mBackup saved to: $c4tdir/backup/$date\e[0m"
fi

echo "Stopping instance..."
cd "$c4tdir"/deploy
docker compose --profile migrations down
docker compose --profile app down

echo "Unpacking c4t_stage.zip..."
if [[test -f "$c4tdir"/c4t_stage/c4t_stage.zip]]; then
tar -xvf "$c4tdir"/c4t_stage/c4t_stage.zip
else
echo -e "\e[31mStage archive not found.\e[0m"
fi

echo "\e[33mPrune existing containers/images and import new ones from /images/? y/n\e[0m"
read prune
if [["$prune" == "y"]]; then
  docker system prune -a -f
  cd "$c4tdir"/images/
    if [[test -f *tar.gz]]; then
	  echo "Unpacking image archives..."
	  for f in *.tar.gz; do echo "$f" && tar -xvf "$f"; done
	fi
  echo "Loading images..."
  for f in *.tar; do cat $f | docker load; done
fi

echo "Starting migrations..."
cd "$c4tdir"/deploy
docker compose --profile migrations up -d

echo "Starting instance..."
docker compose --profile app up -d

echo "\e[32m===UPDATE COMPLETED===\e[0m"