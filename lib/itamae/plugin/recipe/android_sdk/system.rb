# encoding: utf-8

# Run dependency.
include_recipe 'android_sdk::dependency'

# Install path.
if node[:sdk][:install_path]
  INSTALL_DIR = node[:sdk][:install_path]
else
  # Default.
  INSTALL_DIR = '/usr/local'.freeze
end

TEMP_DIR = '/tmp/android_sdk'.freeze

# Android SDK download file.
case node[:platform]
when 'osx', 'darwin'
  ANDROID_SDK_ARCHIVE = "android-sdk_#{node[:sdk][:version]}-macosx.zip".freeze
  ANDROID_SDK_DIR = 'android-sdk-macosx'.freeze
else
  ANDROID_SDK_ARCHIVE = "android-sdk_#{node[:sdk][:version]}-linux.tgz".freeze
  ANDROID_SDK_DIR = 'android-sdk-linux'.freeze
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
execute "tar xvf #{TEMP_DIR}/#{ANDROID_SDK_ARCHIVE} -C #{INSTALL_DIR}" do
  not_if "test -d #{INSTALL_DIR}/#{ANDROID_SDK_DIR}"
end

# Set 'ANDROID_HOME'
execute "echo 'export ANDROID_HOME=#{INSTALL_DIR}/#{ANDROID_SDK_DIR}' >> /etc/profile" do
  user "root"
end
