FROM python:3.6.6

MAINTAINER Luiz Eduardo <luiz@powertic.com>

RUN mkdir locust-tasks

COPY locust-tasks /locust-tasks

WORKDIR /locust-tasks

RUN apt-get install g++

RUN pip install locustio pyzmq

RUN chmod 755 run.sh

EXPOSE 5557 5558 8089

ENTRYPOINT ["./run.sh"]
