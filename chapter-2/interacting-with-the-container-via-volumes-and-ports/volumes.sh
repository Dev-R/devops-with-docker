touch text.log

docker run -v "$(pwd)/text.log:/usr/src/app/text.log" devopsdockeruh/simple-web-service