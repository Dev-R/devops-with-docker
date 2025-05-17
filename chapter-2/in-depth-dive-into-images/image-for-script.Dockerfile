FROM ubuntu:24.04

RUN apt-get update && apt-get -y install curl

COPY script.sh .

RUN chmod +x script.sh

CMD ./script.sh