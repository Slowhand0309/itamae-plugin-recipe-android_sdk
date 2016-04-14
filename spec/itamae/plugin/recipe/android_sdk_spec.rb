# encoding: utf-8
require 'spec_helper'

case host_inventory['platform']
when 'osx', 'darwin'
  path = '/usr/local/android-sdk-macosx'
else
  path = '/usr/local/android-sdk-linux'
end

# Test install Android SDK.
describe file(path) do
  it { should be_directory }
end

# Test set PATH in etc/profile.
describe file('/etc/profile') do
  it { should contain 'ANDROID_HOME' }
end
