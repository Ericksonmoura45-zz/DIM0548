# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN apt update && apt install -y gcc flex bison
