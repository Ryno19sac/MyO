# README

To create a new rails backend, in your terminal type rails new 'MyOBE' --api (this was created using Ruby v2.6.1)

Make sure, once your rails api is created, to update your gemfile and bundle install
(gem 'bcrypt', '~> 3.1.7')

uncomment out the cors gem
(gem 'rack-cors')

other gem additions:

gem "jwt", "~> 2.2"

gem "active_model_serializers", "~> 0.10.10"

gem "faker", "~> 2.13"

gem 'webpack-rails'

gem 'foreman' 

Bundle install after gems are all updated

Finally, go to the config folder and into the cors file and make the file look like this by uncommenting lines 8-16, and also updating the origins to a wildcard ' *'


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
