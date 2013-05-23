## Welcome to The "Hackme"-App

This App will help you learn about Rails and Security.

This version (rails-example-security-solutions) contains the
solutions, look at https://github.com/web-engineering/rails-example-security
for the original challenge.

[![Build Status](https://travis-ci.org/web-engineering/rails-example-security-solutions.png?branch=master)](https://travis-ci.org/web-engineering/rails-example-security-solutions)

## Installation

Two files are not available via the git repository,
you'll have to create them yourself: config/database.yml


    development:
      adapter: sqlite3
      database: db/development.sqlite3
      pool: 5
      timeout: 5000

    test:
      adapter: sqlite3
      database: db/test.sqlite3
      pool: 5
      timeout: 5000

    production:
      adapter: sqlite3
      database: db/production.sqlite3
      pool: 5
      timeout: 5000


And the secret token for sessions: config/initializers/secret_token.rb

      # Be sure to restart your server when you modify this file.

      # Your secret key for verifying the integrity of signed cookies.
      # If you change this key, all old signed cookies will become invalid!
      # Make sure the secret is at least 30 characters and all random,
      # no regular words or you'll be exposed to dictionary attacks.
      HackMe::Application.config.secret_token = '1fa301 ... 890ef'



