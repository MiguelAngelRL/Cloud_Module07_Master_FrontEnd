#!/bin/bash
sudo yum install docker -y
sudo usermod -aG docker ec2-user
sudo service docker start
sudo docker run --rm -p 80:8888 --name myAppContainer miguelangelrl/cloud_exercise:1.0
