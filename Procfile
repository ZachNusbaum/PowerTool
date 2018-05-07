web:     bundle exec puma -C config/puma.rb
redis: bundle exec redis-server
workers: bundle exec sidekiq
#worker:  bundle exec rake jobs:work
release: bundle exec rake db:migrate db:seed
