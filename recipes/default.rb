#
# Cookbook Name:: anodot-relay
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe "apt"
include_recipe "nodejs::npm"

nodejs_npm "anodot-relay" do
  version node['anodot']['version']
end


directory "/etc/anodot-relay" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

template "/etc/anodot-relay/config.json" do
  source "config.json.erb"
  owner "root"
  group "root"
  mode "0644"
end

include_recipe "anodot-relay::service"
