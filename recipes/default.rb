#
# Cookbook Name:: ack
# Recipe:: default
#
# Copyright 2010, NREL
#


case node[:platform]
  when "ubuntu", "debian"
    package_name = "ack-grep"
    binary_path = "/usr/bin/ack-grep"
  else
    include_recipe "yum::repoforge"

    package_name = "ack"
    binary_path = "/usr/bin/ack"
end

package package_name do
  action :install
end

# In Ubuntu the package gets installed as "ack-grep". To keep things consistent
# across platforms, we want to symlink "ack" so that also works.
if (File.basename(binary_path) != "ack")
  link "/usr/bin/ack" do
    to binary_path
  end
end
