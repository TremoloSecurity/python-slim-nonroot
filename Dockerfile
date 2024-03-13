FROM python:3-slim-buster

RUN pip3 install mysql-connector-python kubernetes

USER 431
