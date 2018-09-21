# This is a Chef attributes file. It can be used to specify default and override
# attributes to be applied to nodes that run this cookbook.

# Set a default name
default['audit']['reporter'] = 'chef-server-automate'
default['audit']['fetcher'] = 'chef-server'

if node['os'] == 'linux' && node['platform'] == 'amazon'
   default['audit']['profiles'] = [
   {
    'name': 'Check SSH version 2 is installed v0.1.0',
    'compliance': 'admin/ssh-check'
   }
  ]
end

if node['os'] == 'windows' 
   default['audit']['profiles'] = [
   {
     'name': 'Check password history is set to 24 or more passwords v0.1.0',
     'compliance': 'admin/pwd-check'
   }
  ]
end
# For further information, see the Chef documentation (https://docs.chef.io/essentials_cookbook_attribute_files.html).


