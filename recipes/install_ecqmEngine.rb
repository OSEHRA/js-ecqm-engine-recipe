include_recipe 'rabbitmq'

ecqmEngine_install_app 'js-ecqm-engine' do
  application_path node[:ecqmEngine][:js_ecqm_install_path]
  application_version node[:ecqmEngine][:js_ecqm_version]
  repository node[:ecqmEngine][:js_ecqm_repository]
  repository_key node[:ecqmEngine][:js_ecqm_repository_key]
end

# This is necessary due to https://github.com/rabbitmq/chef-cookbook/commit/c7a37ccfcfe2444d0ff8f567c33da0be055357f8
package 'esl-erlang' do
  action :lock
  version node['erlang']['esl']['version']
end