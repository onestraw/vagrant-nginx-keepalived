#!/bin/bash

# Setup

/usr/bin/apt-get update
/usr/bin/apt-get -y install nginx keepalived

# Configure nginx

cat > /etc/nginx/nginx.conf <<EOD
worker_processes  1;

events {
    worker_connections  128;
}

http {
	upstream backend_pool {
		server 192.168.1.11;
		server 192.168.1.12;
	}

    server {
	    listen 80;
        # virtual address
	    server_name 192.168.1.3;

        access_log /var/log/nginx/access_192.168.1.3.log;
        error_log /var/log/nginx/error_192.168.1.3.log;

	    location / {
	    	proxy_pass http://backend_pool;
	    }
    }

    server {
	    listen 80;
	    server_name 192.168.1.2;

        access_log /var/log/nginx/access_192.168.1.2.log;
        error_log /var/log/nginx/error_192.168.1.2.log;

	    location / {
	    	proxy_pass http://backend_pool;
	    }
    }
}
EOD

cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
/usr/sbin/service nginx restart

# Configure ip_nonlocal_bind

cat >> /etc/sysctl.conf <<EOD 
net.ipv4.ip_nonlocal_bind=1
EOD
sysctl -p

# Configure keepalived

cat > /etc/keepalived/keepalived.conf <<EOD
vrrp_script check_nginx {               # Requires keepalived-1.1.13
        script "killall -0 nginx"       # cheaper than pidof
        interval 2                      # check every 2 seconds
        weight 2                        # add 2 points of prio if OK
}

vrrp_instance VI_1 {
        interface eth1
        state MASTER
        virtual_router_id 56
        priority 100                    # 101 on master, 100 on backup
        virtual_ipaddress {
            192.168.1.3
        }
        track_script {
            check_nginx
        }
}

vrrp_instance VI_2 {
        interface eth1
        state MASTER
        virtual_router_id 57
        priority 101                    # 101 on master, 100 on backup
        virtual_ipaddress {
            192.168.1.2
        }
        track_script {
            check_nginx
        }
}
EOD

/etc/init.d/keepalived restart
