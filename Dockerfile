# syntax=docker/dockerfile:1.7

FROM cgr.dev/chainguard/python:latest-dev AS builder

USER root

WORKDIR /build

RUN pip install \
    --no-cache-dir \
    --prefix=/install \
    mysql-connector-python==9.7.0 \
    kubernetes==35.0.0

# Free Python image from Chainguard: Python 3.14.4
FROM cgr.dev/chainguard/python:latest

COPY --from=builder --chown=431:431 /install /usr/

USER 431
