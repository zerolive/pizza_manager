
namespace :development do
  task :prepare do
    system('RAILS_ENV=development rake db:drop')
    system('RAILS_ENV=development rake db:migrate')
    system('RAILS_ENV=development rake db:seed')
  end
end
