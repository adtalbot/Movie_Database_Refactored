source('https://rubygems.org')

gem('sinatra-contrib', :require => 'sinatra/reloader')

group(:production) do
  gem('sinatra')
  gem('pg')
end

group(:test) do
  gem('pry')
  gem('rspec')
  gem('capybara')
end
