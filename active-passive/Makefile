setup:
	# use the same network interface as bridge
	vagrant up web1 web2 nginx1 nginx2

stop:
	vagrant halt web1 web2 nginx1 nginx2

clean:
	vagrant destroy -f web1 web2 nginx1 nginx2

test:
	vagrant ssh web1 -c 'watch -n 0.5 curl 192.168.1.3'

log-keepalived2:
	vagrant ssh nginx2 -c 'tail -f /var/log/syslog'

log-nginx2:
	vagrant ssh nginx2 -c 'tail -f /var/log/nginx/access.log'
	#
	# stop nginx1 and check if the traffic is moved to nginx2
