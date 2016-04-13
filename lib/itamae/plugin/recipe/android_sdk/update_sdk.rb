# encoding: utf-8

ANDROID_SDK_ROOT = "#{node[:sdk][:install_path]}/#{node[:sdk][:directory]}"

# Interactive android sdk update shell.
TEMPLATE_SRC_PATH = "#{File.expand_path('../../', __FILE__)}/templates/android-update-sdk.sh.erb"
TEMPLATE_DEST_PATH = "#{ANDROID_SDK_ROOT}/tools/android-update-sdk.sh"

package 'expect'

template TEMPLATE_DEST_PATH do
  owner "root"
  group "root"
  mode "0755"
  source TEMPLATE_SRC_PATH
end

update_list = node[:sdk][:update_list].join(',')

# Prepare.
execute "sed -i 's/\r//' #{TEMPLATE_DEST_PATH}" do
end

# Update sdk.
execute "#{TEMPLATE_DEST_PATH} #{update_list}" do
  cwd File.dirname(TEMPLATE_DEST_PATH)
end
