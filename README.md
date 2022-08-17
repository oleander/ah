# README

* Requirements
  * Ruby 3.1
  * PostgreSQL 9.3+

* Installation
  * `bundle install`
  * `bundle exec rails db:create db:migrate`
  * `bundle exec rails db:seed` (TODO)
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

* TODO
  * Use rubocop to enforce style
