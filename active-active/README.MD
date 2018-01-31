# Active-Active mode

## What does the Vagrantfile do?

* It sets up a 4 VM mini public network inside Virtualbox.
* It set a vip address (192.168.1.3)
* It installs Apache on the two web servers, and configures it with a index page that identifies which host you're viewing the page on.
* It installs nginx and keepalived on the two nginx hosts, and drops a configuration file in place with the two webservers pre-configured.

## Getting started

* Open 4 terminal windows -- one for each host.  Change to the directory containing the Vagrantfile.
* In terminal #1, run ``` vagrant up nginx1 && vagrant ssh nginx1 ```
* In terminal #2, run ``` vagrant up nginx2 && vagrant ssh nginx2 ```
* In terminal #3, run ``` vagrant up web1 && vagrant ssh web1 ```
* In terminal #4, run ``` vagrant up web2 && vagrant ssh web2 ```
* To shut down the VM's, run ``` vagrant halt web1 web2 nginx1 nginx2 ```
* To remove the VM's from your hard drive, run ``` vagrant destroy web1 web2 nginx1 nginx2 ```
* If you wish to remove the cached image file from which these machines were created, run ``` vagrant box remove precise32 ```
