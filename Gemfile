source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Heroku uses the ruby version to configure your application"s runtime.
ruby "2.5.1"

# Back-endy
gem "bootsnap", "~> 1.3", require: false
gem "pg", "~> 1.0"
gem "puma", "~> 3.11"
gem "rack-canonical-host", "~> 0.2"
gem "rails", "~> 5.2"
gem "pry-rails", "~> 0.3"
gem "chronic", "~> 0.10"
gem "faraday", "~> 0.12"
gem "faraday_middleware", "~> 0.12"

# Front-endy
gem "autoprefixer-rails", "~> 8.5"
gem "bootstrap-sass", "~> 3.3"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails", "~> 4.3"
gem "sass-rails", "~> 5.0" # Only needed for generator (e.g. rail g controller Users)
gem "simple_form", "~> 4.0"
gem "slim-rails", "~> 3.1"
gem "uglifier", "~> 4.1"
gem "bcrypt"

# Tools
gem "awesome_print", "~> 1.8"
gem "rotp", "~> 3.3"
gem "active_interaction", "~> 3.6"
gem "devise", "~> 4.6"
gem "money-rails", "~> 1.11"

# Env specific dependencies...

group :production, :acceptance do
  gem "rack-timeout", "~> 0.5"
end

group :development, :test do
  gem "factory_bot_rails", "~> 4.10"
  gem "better_errors", "~> 2.9"
  gem "binding_of_caller", "~> 0.8"
  gem "rspec-rails", "~> 3.7"
  gem "rspec_junit_formatter", "~> 0.4"
  gem "rubocop", "~> 0.56", require: false
  gem "letter_opener", "~> 1.6"
end

group :development do
  gem "annotate", "~> 2.7"
  gem "dotenv-rails", "~> 2.4"
  gem "launchy", "~> 2.4"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-commands-rspec", "~> 1.0"
  gem "spring-watcher-listen", "~> 2.0"
  # gem "guard"
  # gem "guard-rspec", ">= 4.6.5" # Resolves to 1.x without a version constraint. :/
  # gem "guard-livereload"
end

group :test do
  gem "capybara", "~> 3.15"
  # gem "capybara-email"
  gem "capybara-selenium", "~> 0.0"
  gem "simplecov", "~> 0.16"
end

gem "sidekiq", "~> 5.1"
gem "sidekiq-scheduler", "~> 2.2"
gem "activeadmin", "~> 1.3"

gem "omniauth", "~> 1.8"
gem "omniauth-github", "~> 1.1"
gem "omniauth-facebook", "~> 5.0"
gem "omniauth-twitter", "~> 1.4"
gem "omniauth-google-oauth2", "~> 0.5"
gem "ahoy_email", "~> 0.5"
gem "ahoy_matey", "~> 2.1"
gem "stripe", "~> 3.15"
gem "smartystreets_ruby_sdk", "~> 5.3"
gem "jwt", "~> 1.5"
gem "premailer-rails", "~> 1.10"
gem "receipts", "~> 0.2"
#gem 'gdpr_rails'
gem "aws-sdk-s3", "~> 1.13", require: false
gem "mini_magick", "~> 4.8"
gem 'semantic-ui-sass', "~> 2.3"
gem "kaminari", "~> 1.1"
gem "pundit", "~> 1.1"
gem "octokit", "~> 4.9"
gem "koala", "~> 3.0"
gem "doorkeeper", "~> 4.3"
gem "flutie", "~> 2.0"
gem "WordDescriptor", github: 'ZachNusbaum/word_descriptor'
gem "sentry-raven", "~> 2.7"
gem 'omniauth-spotify', "~> 0.0"
gem "rspotify", "~> 2.1"
gem "PostDmarc", github: 'ZachNusbaum/PostDmarc'
gem 'google-api-client', '~> 0.22', require: 'google/apis'
gem 'attr_encrypted', '~> 3.0'
gem 'devise-two-factor'
gem 'chunky_png'
gem 'rqrcode'
gem 'rails-erd'
gem 'notifications', '~> 0.6.0'
gem "OmniauthAccessGate", github: 'zdann120/csid-gate'