service 'apache2' do
  action :nothing
end

Chef::Log.info("Starting PHP Memory Limit update")
bash "change_phpmemorylimit" do
  user "root"
  code <<-'EOH'
    sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php.ini
  EOH

  action :nothing
  notifies :restart, resources(:service => 'apache2')
  timeout 70
end
Chef::Log.info("Ending PHP Memory Limit update")