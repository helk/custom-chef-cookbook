Chef::Log.info("Starting PHP Memory Limit update")
bash "change_phpmemorylimit" do
  user "root"
  code <<-'EOH'
  sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php.ini
  EOH
end
Chef::Log.info("Ending PHP Memory Limit update")