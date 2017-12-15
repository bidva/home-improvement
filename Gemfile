source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# rails
gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'pundit'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 3.2'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# other
gem 'devise', '~> 4.2'
gem 'dotenv-rails'
gem 'omniauth-facebook'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files,
# so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
