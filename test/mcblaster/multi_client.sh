#!/bin/bash

killall mcblaster
nodes=$1
rate=$2
core=0
total_core=1
dp=8888
idx=1

./mcblaster \
-t 1 -k 100 \
-z 135 -u $((dp)) \
-r $((rate)) \
-d 30 127.0.0.1 

echo "started all client"
