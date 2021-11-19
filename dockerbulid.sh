#!/bin/bash
vers="v2"
docker build -t yumsrv:$vers -f ./Dockerfile .
#tag and upload to dockerhub
docker tag yumsrv:$vers cxlj2003/yumsrv:$vers
docker push cxlj2003/yumsrv:$vers
#tag and upload to github
docker tag yumsrv:$vers ghcr.io/cxlj2003/yumsrv:$vers
docker push ghcr.io/cxlj2003/yumsrv:$vers