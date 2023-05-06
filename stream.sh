#!/bin/bash

for((;;)); do
	raspivid -n -t 0 -w 1920 -h 1080 -g 60 -fps 24 -b 5000000 -br 55 -mm average --ISO 200 -ss 33000 -ex fixedfps -ih -pf high -o udp://192.168.10.1:5000
done
