FROM alpine 

WORKDIR /usr/app

COPY ./script.sh /usr/app

ENTRYPOINT ./script.sh