# encoding: utf-8

node[:sdk] ||= {}

# To disable user specified.
node[:sdk][:update_list] = nil

# Run install.
include_recipe 'android_sdk::install'

# Run update sdk latest.
include_recipe 'android_sdk::update_sdk'
