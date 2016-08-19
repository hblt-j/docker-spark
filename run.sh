#!/bin/bash
docker run -idt -P -p 8080:18080 --net=none --name node0 -h node0 -v /home/by-j/app:/home/by-j/app spark-master
docker run -idt -P --net=none --name node1 -h node1 -v /home/by-j/app:/home/by-j/app spark-worker spark://node0:7077
docker run -idt -P --net=none --name node2 -h node2 -v /home/by-j/app:/home/by-j/app spark-worker spark://node0:7077

pipework br0 -i eth1 node0 192.168.52.30/22@192.168.55.255
pipework br0 -i eth1 node1 192.168.52.31/22@192.168.55.255
pipework br0 -i eth1 node2 192.168.52.32/22@192.168.55.255

brctl addbr br0  # 新建一个桥接虚拟网卡
ip link set br0 up
#pipework br0 test1 dhcp
ip addr add 192.168.52.28/22 dev br0
ip addr del 192.168.52.28/22 dev eth0
brctl addif br0 eth0   # 将eth0加入到br0
ip route del default
ip route add default via 192.168.55.255 dev br0
