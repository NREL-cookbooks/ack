#
# Cookbook Name:: ack
# Recipe:: default
#
# Copyright 2010, NREL
#

include_recipe "yum::epel"

package_name = "ack"
binary_path = "/usr/bin/ack"

case node[:platform]
when "ubuntu", "debian"
  package_name = "ack-grep"
  binary_path = "/usr/bin/ack-grep"
end

package package_name do
  action :install
end

# In Ubuntu the package gets installed as "ack-grep". To keep things consistent
# across platforms, we want to symlink "ack" so that also works.
if(File.basename(binary_path) != "ack")
  link "/usr/bin/ack" do
    to binary_path
  end
end

# Replace the installed version of the ack binary with a newer version. Since
# ack is really just a standalone binary, this isn't a huge deal.
#
# We're doing this to get at least version 1.93_01 where .spec files are
# automatically parsed as ruby.
cookbook_file "ack" do
  source "ack"
  path binary_path
  mode "0755"
  owner "root"
  group "root"
end
