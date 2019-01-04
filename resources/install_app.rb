default_action :create

attribute :name, :kind_of => String
attribute :repository, :kind_of => String
attribute :repository_key, :kind_of => String
attribute :application_path, :kind_of => String
attribute :application_version, :kind_of => String
attribute :delayed_job_count, :kind_of => Integer, :default => 3
attribute :env_vars, :kind_of => Hash, :default => {}
