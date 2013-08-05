def config
end

namespace :content do
  task :services => :environment do
    config = YAML::load_file("#{Rails.root}/config/content.yml")
    config['services'].each do |name, options|
      from_attributes = options.merge name: name
      Service.create from_attributes
    end
  end

  task :tags => :environment do
    config = YAML::load_file("#{Rails.root}/config/content.yml")
    config['tags'].each do |name|
      Tag.create name: name
    end
  end
end

desc "Create content from a YAML configuration"
task :content => %w(content:services content:tags)
