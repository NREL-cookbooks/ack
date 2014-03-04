#
# Cookbook Name:: ack
# Recipe:: default
#
# Copyright 2010, NREL
#

include_recipe "perl"

# Remove the package-based installation.
package "ack" do
  if(platform_family?('ubuntu'))
    package_name "ack-grep"
  end

  action :remove
end

# Install the single-file executable version.
remote_file "/usr/bin/ack" do
  source node[:ack][:download_url]
  checksum node[:ack][:checksum]
  mode 0755
end
