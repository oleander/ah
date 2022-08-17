# AroundHome [![Ruby on Rails CI](https://github.com/oleander/ah/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/oleander/ah/actions/workflows/rubyonrails.yml)

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

## Solution in a nutshell

Where `10.0` and `20.0` are placeholder latitude and longitude of a request.

``` sql
    SELECT
        partners.*,
        earth_distance(
          ll_to_earth(partners.lat, partners.lng),
          ll_to_earth(10.0, 20.0)
        ) AS distance
    FROM
        "partners"
    INNER JOIN
        "experiences"
            ON "experiences"."partner_id" = "partners"."id"
    INNER JOIN
        "materials"
            ON "materials"."id" = "experiences"."material_id"
    WHERE
        "materials"."id" IN (
            SELECT
                "materials"."id"
            FROM
                "materials"
            INNER JOIN
                "requirements"
                    ON "materials"."id" = "requirements"."material_id"
            WHERE
                "requirements"."request_id" = $1
        )
    GROUP BY
        "partners"."id"
    HAVING
        (
            earth_distance(
              ll_to_earth(partners.lat, partners.lng),
              ll_to_earth(10.0, 20.0)
            ) <= partners.operating_radius
        )
    ORDER BY
        rating DESC,
        distance ASC
```

