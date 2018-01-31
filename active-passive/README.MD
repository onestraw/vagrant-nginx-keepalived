# Active-Passive mode

## What does the Vagrantfile do?

* It sets up a 4 VM mini public network inside Virtualbox.  The four hosts are nginx1 (192.168.1.9), nginx1 (192.168.1.10), web1 (192.168.1.11), and web2 (192.168.1.12)
* It set a vip address (192.168.1.3)
* It installs Apache on the two web servers, and configures it with a index page that identifies which host you're viewing the page on.
* It installs nginx and keepalived on the two nginx hosts, and drops a configuration file in place with the two webservers pre-configured.

## Getting started

1.  Open 4 terminal windows -- one for each host.  Change to the directory containing the Vagrantfile.
2.  In terminal #1, run ``` vagrant up nginx1 && vagrant ssh nginx1 ```
3.  In terminal #2, run ``` vagrant up nginx2 && vagrant ssh nginx2 ```
4.  In terminal #3, run ``` vagrant up web1 && vagrant ssh web1 ```
5.  In terminal #4, run ``` vagrant up web2 && vagrant ssh web2 ```
6.  Open up [http://192.168.1.9/](http://192.168.1.9/) in your host's browser.  This is the nginx1 load balanced
7.  Open up [http://192.168.1.10/](http://192.168.1.10/) in your host's browser.  This is the nginx2 load balanced
8.  Open up [http://192.168.1.11/](http://192.168.1.11/) in a browser to see if web1's Apache is working.
9.  Open up [http://192.168.1.12/](http://192.168.1.12/) in a browser to see if web2's Apache is working.
10.  To shut down the VM's, run ``` vagrant halt web1 web2 nginx1 nginx2 ```
11.  To remove the VM's from your hard drive, run ``` vagrant destroy web1 web2 nginx1 nginx2 ```
12.  If you wish to remove the cached image file from which these machines were created, run ``` vagrant box remove precise32 ```
