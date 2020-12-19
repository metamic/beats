# beats

Use beats easily.


## usage

in your terminal

first, clone this project

```
git clone https://github.com/metamic/beats.git
cd beats
```

second, change your login password in .env

```
HOST=172.30.1.11:5044
ELASTICSEARCH_PASSWORD=mypassword <<< here

FILEBEAT_VERSION=7.10.1 
```

last, run script

```
chmod 755 ./filebeat.sh
./filebeat <YOUR_CONTAINER_NAME> <LOG_PATH>
```