#
# Cookbook Name:: arch_init
# Recipe:: default
#
# Copyright 2012, Joe Fredette
#
# All rights reserved - Do Not Redistribute
#

bash 'clear old package cache' do
  user 'root'
  code 'pacman -Scc --noconfirm --noprogressbar'
end

bash 'force update package databases' do
  user 'root'
  code 'pacman -Syy --noconfirm --noprogressbar'
end

file '/etc/locale.conf' do
  owner 'root'
  backup false

  mode '644'
  content 'LC_ALL=en_US.UTF-8'
end
