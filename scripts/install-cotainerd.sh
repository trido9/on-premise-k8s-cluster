#!/bin/bash

# containerd
wget https://github.com/containerd/containerd/releases/download/v1.7.22/containerd-1.7.22-linux-amd64.tar.gz
tar Cxzvf /usr/local containerd-1.7.22-linux-amd64.tar.gz
curl -fsSL https://raw.githubusercontent.com/containerd/containerd/main/containerd.service | sudo tee /lib/systemd/system/containerd.service
systemctl daemon-reload
systemctl enable --now containerd
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml

# runc
wget https://github.com/opencontainers/runc/releases/download/v1.2.0-rc.3/runc.amd64
install -m 755 runc.amd64 /usr/local/sbin/runc

# CNI plugin
wget https://github.com/containernetworking/plugins/releases/download/v1.5.1/cni-plugins-linux-amd64-v1.5.1.tgz
mkdir -p /opt/cni/bin
tar Cxvzf /opt/cni/bin cni-plugins-linux-amd64-v1.5.1.tgz