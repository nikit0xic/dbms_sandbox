```shell
docker pull postgres:latest

sudo docker build -t psql_trainer_i .

docker run -d --name psql_trainer-c -p 5432:5432 psql_trainer_i
```
Либо запустите скрипт из текущей директории:
````shell
sudo ./start_trainer.sh 
````

```shell
docker exec -it psql_trainer-c /bin/bash

psql -U trainee -d trainer
```


### SQL гид

```postgresql
SELECT table_name FROM information_schema.tables WHERE table_name ILIKE '%catalog%' ORDER BY ASC 



```



