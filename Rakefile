require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete (no data loss)'
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete (data was lost)'
  end

  desc "TEST ENV Destructive upgrade"
  task :test_auto_migrate do
    DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
    DataMapper.auto_migrate!
    puts 'TESTAuto-migrate complete (data was lost)'
  end

end
