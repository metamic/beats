# beats

Use beats easily.


## usage

in your terminal

first, clone this project

```
git clone https://github.com/metamic/beats.git
cd beats
```

second, change your host
```
HOST=<YOUR HOST>:5044
FILEBEAT_VERSION=7.10.1 
```

last, run script

```
chmod 755 ./filebeat.sh
./filebeat <YOUR_CONTAINER_NAME> <LOG_PATH>
```