docker run -d --name missing-dependencies-task ubuntu sh -c 'while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://helsinki.fi; done'

docker exec -it missing-dependencies-task bash

apt-get update

apt-get -y install curl