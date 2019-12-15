#!/bin/bash

set -xe

export CGO_ENABLED=0 GOOS=linux GOARCH=amd64
go build -o main
docker-compose up -d --build
