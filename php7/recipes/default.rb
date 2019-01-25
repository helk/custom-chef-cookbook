package 'apache2'
service 'apache2' do
  action :nothing
end

bash 'overrride install php7.2' do
  code <<-EOH
    yum update -y
    amazon-linux-extras install -y php7.2
    
    a2dismod php5
    a2enmod php7.2
  EOH
  notifies :restart, "service[apache2]"
  not_if "which php7.2"
end