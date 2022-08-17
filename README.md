# README [![Ruby on Rails CI](https://github.com/oleander/ah/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/oleander/ah/actions/workflows/rubyonrails.yml)

* Requirements
  * Ruby 3.1
  * PostgreSQL 9.3+
    * With support for the `cube` and `earthdistance` extensions

* Installation
  * `bundle install`
  * `bundle exec rails db:create db:migrate`
  * `bundle exec rails db:seed`
  * `bundle exec rails server`
  * Open
    * http://localhost:3000/partners/1
    * http://localhost:3000/requests/1/partners/1

* How to run the test suite
  * `bundle exec rspec`

* Possible improvements
  * Joined indexes on relational tables
  * Geo indexes on `lat` and `lng`
  * Authentication
  * Caching
