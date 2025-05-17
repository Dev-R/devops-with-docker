docker run -d --name secret-message devopsdockeruh/simple-web-service:ubuntu

docker logs -f secret-message

docker exec -it secret-message bash