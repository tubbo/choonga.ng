namespace :db do
  desc "Create the Postgres user"
  task :user => :environment do
    sh 'createuser -s choongang'
  end
end

task :db => ['db:user', 'db:create', 'db:schema:load', 'db:test:prepare']
