#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2012, Joseph Fredette
#
# All rights reserved - Do Not Redistribute
#


# THIS MUST GO FIRST
# -- if it doesn't, then we'll install and then immediately upgrade
#
#only when rvm is installed already
bash 'upgrade rvm to most recent stable version' do
  user 'root'
  code 'rvm get stable'
  only_if 'test -e /user/local/rvm/bin/rvm'
end

# THIS MUST GO SECOND
# -- see above
#
#only if rvm isn't installed
bash 'install rvm as root' do
  user 'root'
  code 'curl -L https://get.rvm.io | sudo bash ; echo'
  not_if 'test -e /usr/local/rvm/bin/rvm'
end
