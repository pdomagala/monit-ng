#
# Cookbook Name:: monit
# Recipe:: default
#

case node.monit.install_method
when 'repo'
  include_recipe "yum::epel" if platform_family?("rhel")
  include_recipe "ubuntu" if platform?("ubuntu")
  package 'monit'
  include_recipe "monit::_common"
when 'source'
  include_recipe "monit::source"
else
  raise ArgumentError, "Unknown install_method '#{node.monit.install_method}' passed to monit cookbook"
end
