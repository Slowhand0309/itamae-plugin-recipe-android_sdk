# encoding: utf-8

ANDROID_SDK_ROOT = "#{node[:sdk][:install_path]}/#{node[:sdk][:directory]}"

# Interactive android sdk update shell.
TEMPLATE_SRC_PATH = "#{File.expand_path('../../', __FILE__)}/templates/android-update-sdk.sh.erb"
TEMPLATE_LATEST_SRC_PATH = "#{File.expand_path('../../', __FILE__)}/templates/android-update-sdk-latest.sh.erb"
TEMPLATE_DEST_PATH = "#{ANDROID_SDK_ROOT}/tools/android-update-sdk.sh"

case node[:platform]
when 'osx', 'darwin'
  # Already installed.
else
  package 'expect'
end

src_path = TEMPLATE_LATEST_SRC_PATH
update_list = ''

if node[:sdk][:update_list]
  # Filter by user.
  src_path = TEMPLATE_SRC_PATH
  update_list = node[:sdk][:update_list].join(',')
end

template TEMPLATE_DEST_PATH do
  mode "0755"
  source src_path
end

# Prepare.
case node[:platform]
when 'osx', 'darwin'
  option = '-e'
else
  option = '-i'
end
execute "sed #{option} 's/\r//' #{TEMPLATE_DEST_PATH}" do
end

# Update sdk.
execute "#{TEMPLATE_DEST_PATH} #{update_list}" do
  cwd File.dirname(TEMPLATE_DEST_PATH)
end
