#!/bin/bash

killall mcblaster
nodes=$1
rate=$2
core=0
total_core=1
fp=10000
dp=8888
idx=1

for n in `seq $nodes`
do
	taskset -c $((core % total_core)) ./mcblaster \
-t 1 -k 100 \
-z 135 -u $((dp)) \
-f $((fp)) -r $((rate)) \
-d 30 127.0.0.1 &

	fp=$((fp+1))
	dp=$((dp))
	core=$((core+1))
	rate=$((rate*idx))
	i=$((idx+1))
done

echo "started all client"
