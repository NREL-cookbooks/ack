#
# Cookbook Name:: ack
# Recipe:: default
#
# Copyright 2010, NREL
#

case node[:platform]
when "ubuntu", "debian"
  package "ack-grep" do
    action :install
  end
else
  package "ack" do
    action :install
  end
end
