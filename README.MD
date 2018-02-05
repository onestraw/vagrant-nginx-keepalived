# Vagrant-nginx-keepalived

Demo of Nginx high availability using Vagrant

* [Active-passive](active-passive/)
* [Active-active](active-active/)


## Prerequisites

1. Install [Vagrant](http://www.vagrantup.com/downloads.html)
2. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
3. Clone this repo with ``` git clone https://github.com/onestraw/vagrant-nginx-keepalived.git ```


## [Keepalived split-brain 脑裂问题](https://cloud.tencent.com/developer/article/1027323)

> 指在一个高可用（HA）系统中，当联系着的两个节点断开联系时，本来为一个整体的系统，分裂为两个独立节点，这时两个节点开始争抢共享资源，结果会导致系统混乱，数据损坏。

> 对于无状态服务的HA，无所谓脑裂不脑裂；但对有状态服务(比如MySQL)的HA，必须要严格防止脑裂。（但有些生产环境下的系统按照无状态服务HA的那一套去配置有状态服务，结果可想而知...）


## Reference material

* [Vagrant](http://vagrantup.com)
* [VirtualBox](http://www.virtualbox.org)
* [Keepalived](http://www.keepalived.org/)
* [Vagrant-haproxy-keepalived](https://github.com/mezgani/vagrant-haproxy-keepalived)
