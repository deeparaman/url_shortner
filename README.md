URL shortener

URL shortener is an application that shortened the large url to a tiny one

Requirements
Ruby 2.2.3
Mysql 5.5.57 or above

Setup
git clone https://github.com/athiraramanan/Url_Shortner.git
cd Url_Shortner
bundle install
Setting up local development database (preferably sqlite)
bundle exec rake db:create
bundle exec rake db:migrate

Running the development server
bundle exec rails server

Testing
bundle exec rspec

Apidoc
Access api-doc via '#{Rails.root}/tiny_urls_apidoc/'
