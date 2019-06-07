default[:ecqmEngine][:ecqmEngine_env_vars] =
{
  "AUTO_APPROVE" => "false",
  "IGNORE_ROLES" => "false",
  "ENABLE_DEBUG_FEATURES" => "false",
  "DEFAULT_ROLE" => "",
}

default[:ecqmEngine][:js_ecqm_install_path] = '/opt/js-ecqm-engine'
default[:ecqmEngine][:js_ecqm_repository] = 'https://dl.packager.io/srv/deb/OSEHRA/js-ecqm-engine/master/ubuntu'
default[:ecqmEngine][:js_ecqm_repository_key] = 'https://dl.packager.io/srv/OSEHRA/js-ecqm-engine/key'
default[:ecqmEngine][:js_ecqm_version] = ''

force_default['erlang']['install_method'] = "esl"
force_default['erlang']['esl']['version'] = "1:21.2.6-1"
