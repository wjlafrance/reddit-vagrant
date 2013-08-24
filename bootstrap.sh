sudo apt-get update

sudo apt-get -y install curl postgresql postgresql-client

# reddit expects a utf8 locale database but ubuntu defaults to en_US locale
# http://kb.imakewebsites.ca/2013/06/17/installing-reddit-on-a-vagrant-ubuntu-12-04-box/
sudo pg_dropcluster --stop 9.1 main
sudo pg_createcluster --locale=en_US.utf8 --start 9.1 main

curl -O https://raw.github.com/reddit/reddit/master/install-reddit.sh

chmod +x install-reddit.sh

sudo ./install-reddit.sh
