MY_APP = YAML.load(
  File.read("#{Rails.root}/config/my_config.yml"), aliases: true)[Rails.env]
