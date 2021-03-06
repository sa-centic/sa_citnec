source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgres as the database for Active Record
gem "pg"

gem 'factory_bot'

gem 'bootstrap5-kaminari-views'

gem 'prawn-rails'

gem "nokogiri", ">= 1.13.4"

gem 'cocoon'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

gem "rails-i18n"

# Ekstra bootstrap templates
gem "bootstrap_form", "~> 5.0"

# Injecter Bootstrap template til de default devise views
gem 'devise-bootstrap-form'

# Debugging
gem "byebug"

#Pagination - Tjek UsersController's index metode - https://github.com/kaminari/kaminari
gem 'kaminari'

#Mail-service hosted lokalt - https://github.com/ryanb/letter_opener
gem "letter_opener", group: :development

#SLIM > HTML.ERB - https://erb2slim.com/
gem "slim-rails"

# Authentication - https://github.com/heartcombo/devise
gem "devise"

# Scoping - https://github.com/varvet/pundit
gem "pundit"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev] rr
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

gem "simple_form"


# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"


# querying, sorting, & searching for objects - https://github.com/activerecord-hackery/ransack
gem 'ransack'

gem "faker"

gem 'prawn'

gem 'prawn-html'

gem 'prawn-table'

gem 'prawn-markup'



# gem 'jquery-turbolinks'



# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
#gem "sassc-rails", "~> 2.1.2"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "xpath"
  gem 'heavens_door'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]

  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"

end
