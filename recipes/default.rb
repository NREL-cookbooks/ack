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

  link "/usr/bin/ack" do
    to "/usr/bin/ack-grep"
  end
else
  package "ack" do
    action :install
  end
end
