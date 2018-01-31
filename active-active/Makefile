setup:
	# use the same network interface as bridge
	vagrant up web1 web2 nginx1 nginx2

stop:
	vagrant halt web1 web2 nginx1 nginx2

clean:
	vagrant destroy -f web1 web2 nginx1 nginx2

test:
	vagrant ssh web1 -c 'watch -n 0.5 curl 192.168.1.2'
	# vagrant ssh web1 -c 'watch -n 0.5 curl 192.168.1.3'

log-keepalived:
	vagrant ssh nginx1 -c 'tail -f /var/log/syslog'
	# vagrant ssh nginx2 -c 'tail -f /var/log/syslog'

log-nginx:
	vagrant ssh nginx1 -c 'tail -f /var/log/nginx/access_192.168.1.2.log'
	#vagrant ssh nginx1 -c 'tail -f /var/log/nginx/access_192.168.1.3.log'
	#vagrant ssh nginx2 -c 'tail -f /var/log/nginx/access_192.168.1.2.log'
	#vagrant ssh nginx2 -c 'tail -f /var/log/nginx/access_192.168.1.3.log'
