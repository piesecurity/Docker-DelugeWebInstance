# Docker-DelugeWebInstance
For those cases when you need a disposable full featured torrent client.

## Instructions

Downloaded Files will be stored in what you define for /home/LocalFileStorage

```
docker run -it -v /home/LocalFileStorage/:/var/lib/deluge -p 8112:8112 image_name
```
