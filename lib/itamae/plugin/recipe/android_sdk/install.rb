# encoding: utf-8

# Run dependency.
include_recipe 'android_sdk::dependency'

# Install path.
node[:sdk][:install_path] ||= '/usr/local'

TEMP_DIR = '/tmp/android_sdk'.freeze

# Android SDK download file.
case node[:platform]
when 'osx', 'darwin'
  ANDROID_SDK_ARCHIVE = "android-sdk_#{node[:sdk][:version]}-macosx.zip".freeze
  node[:sdk][:directory] = 'android-sdk-macosx'.freeze
else
  ANDROID_SDK_ARCHIVE = "android-sdk_#{node[:sdk][:version]}-linux.tgz".freeze
  node[:sdk][:directory] = 'android-sdk-linux'.freeze
end

# Android SDK download URL.
ANDROID_SDK_URL = "http://dl.google.com/android/#{ANDROID_SDK_ARCHIVE}".freeze

package 'wget'

directory TEMP_DIR do
  action :create
end

# Download.
execute "wget #{ANDROID_SDK_URL} -O #{TEMP_DIR}/#{ANDROID_SDK_ARCHIVE}" do
  not_if "test -e #{TEMP_DIR}/#{ANDROID_SDK_ARCHIVE}"
end

# Extract.
case node[:platform]
when 'osx', 'darwin'
  cmd = "unzip #{TEMP_DIR}/#{ANDROID_SDK_ARCHIVE} -d #{node[:sdk][:install_path]}"
else
  cmd = "tar xvf #{TEMP_DIR}/#{ANDROID_SDK_ARCHIVE} -C #{node[:sdk][:install_path]}"
end

execute cmd do
  not_if "test -d #{node[:sdk][:install_path]}/#{node[:sdk][:directory]}"
end

# Set 'ANDROID_HOME'
execute "echo 'export ANDROID_HOME=#{node[:sdk][:install_path]}/#{node[:sdk][:directory]}' >> /etc/profile" do
  user "root"
end

# Update sdk list.
if node[:sdk][:update_list]
  include_recipe 'android_sdk::update_sdk'
end
