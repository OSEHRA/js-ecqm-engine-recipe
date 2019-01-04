action :create do
  install_path = new_resource.application_path

  # Suggested by mongo (https://docs.mongodb.com/manual/tutorial/transparent-huge-pages/)
  cookbook_file '/etc/systemd/system/disable-transparent-hugepages.service' do
    source "disable-transparent-hugepages.service"
  end

  apt_repository "mongodb" do
    uri "http://repo.mongodb.org/apt/ubuntu"
    distribution "xenial" + "/mongodb-org/3.4"
    components ["multiverse"]
    keyserver "keyserver.ubuntu.com"
    key "0C49F3730359A14518585931BC711F9BA15703C6"
  end

  apt_repository new_resource.name do
    uri new_resource.repository
    distribution "16.04"
    components ["main"]
    key new_resource.repository_key
  end

  # Chef doesn't seem to provide a way to specify that the package should
  # both be installed and locked to a version so we're iterating to
  # solve that, this is temporary code anyway until the problems with mongo
  # 3.4.6 are solved.
  [ :install, :lock ].each do |install_action|
    [
      "mongodb-org-mongos", "mongodb-org-server",
      "mongodb-org-shell", "mongodb-org-tools", "mongodb-org"
    ].each do |pkg|
      package pkg do
        action install_action
        version '3.4.5'
      end
    end
  end

  service "disable-transparent-hugepages" do
    action [:start, :enable]
  end

  cookbook_file '/etc/mongod.conf' do
    source "mongod.conf"
    notifies :restart, 'service[mongod]'
  end

  service "mongod" do
    action [:start, :enable]
  end

  # Lock the version to whatever is installed by
  # this Chef recipe in order to require the user
  # to run the upgrade script to upgrade ecqmEngine
  # and also protect the user from accidently
  # upgrading ecqmEngine when they did not intend to
  [ :install, :lock ].each do |install_action|
    package new_resource.name do
      action install_action
      version new_resource.application_version
    end
  end

  # Install the ntp service in order to make sure the time on
  # the server is correct for tests.
  package 'ntp' do
    action :install
  end

  # Set all ENV variables passed in through the env_vars hash
  # for the application
  new_resource.env_vars.each do |key, value|
    ecqmEngine_pkgr_env new_resource.name do
      key key
      value value
    end
  end

  ecqmEngine_pkgr_env new_resource.name do
    key "worker"
    value new_resource.delayed_job_count.to_s
    action :scale
  end

end
