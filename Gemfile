source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Heroku uses the ruby version to configure your application"s runtime.
ruby "2.5.1"

# Back-endy
gem "bootsnap", require: false
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.2.0"
gem "pry-rails"
gem "chronic"
gem "faraday"
gem "faraday_middleware"

# Front-endy
gem "autoprefixer-rails"
gem "bootstrap-sass"
gem "coffee-rails"
gem "jquery-rails"
gem "sass-rails" # Only needed for generator (e.g. rail g controller Users)
gem "simple_form"
gem "slim-rails"
gem "uglifier"

# Tools
gem "awesome_print"
gem "rotp"
gem "active_interaction", "~> 3.6.1"
gem "devise", "~> 4.4.3"
gem "money-rails"

# Env specific dependencies...

group :production, :acceptance do
  gem "rack-timeout"
end

group :development, :test do
  gem "factory_bot_rails"
  gem "better_errors"
  gem "rspec-rails"
  gem "rspec_junit_formatter"
  gem "rubocop", require: false
  gem "letter_opener"
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "dotenv-rails"
  gem "launchy"
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  # gem "guard"
  # gem "guard-rspec", ">= 4.6.5" # Resolves to 1.x without a version constraint. :/
  # gem "guard-livereload"
end

group :test do
  gem "capybara"
  # gem "capybara-email"
  gem "capybara-selenium"
  gem "simplecov"
end

gem "sidekiq"
gem "sidekiq-scheduler"
gem "activeadmin"

gem "omniauth"
gem "omniauth-github"
gem "ahoy_email"
gem "ahoy_matey"
gem "stripe"
gem "smartystreets_ruby_sdk"
gem "jwt"
gem "premailer-rails"
gem "receipts"
gem 'gdpr_rails'
gem "aws-sdk-s3", require: false
gem "mini_magick"