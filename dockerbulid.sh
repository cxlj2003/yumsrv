#!/bin/bash
vers="v2"
docker build -t yumsrv:$vers -f ./Dockerfile .
docker tag yumsrv:$vers cxlj2003/yumsrv:latest
docker push cxlj2003/yumsrv
