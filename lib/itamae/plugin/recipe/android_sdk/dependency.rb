# encoding: utf-8


case node[:platform]
when 'redhat'

  # resolve aapt 32bit problem for 64bit
  if node[:kernel][:machine] == 'x86_64'
    #sudo yum update libstdc++ zlib
    execute "yum -y update libstdc++ zlib" do
      user "root"
    end
    # sudo yum install libstdc++.i686 zlib.i686
    %w(libstdc++.i686 zlib.i686).each do |pkg|
      package pkg
    end
  end

when 'debian', 'ubuntu'

  # resolve aapt 32bit problem for 64bit
  if node[:kernel][:machine] == 'x86_64'
    # sudo apt-get install lib32stdc++6 lib32z1
    %w(lib32stdc++6 lib32z1).each do |pkg|
      package pkg
    end
  end
else
end
