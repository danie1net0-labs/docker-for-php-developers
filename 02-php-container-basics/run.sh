docker build -t phpinfo .

docker run -p 8080:80 -d --name=phpinfo phpinfo
