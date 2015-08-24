#!/bin/bash
sudo yum -y install golang git bind-utils
mkdir ~/go
export GOPATH=~/go
go get github.com/miekg/dns
go get github.com/mesosphere/mesos-dns
cd $GOPATH/src/github.com/mesosphere/mesos-dns
go build -o mesos-dns
