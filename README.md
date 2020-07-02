IDT Coding Exercise
=========
Description
---------
For implementing Ajax call from React to backend I created two controllers: sitemap and home(root path). In the home controller, we use `react_component` helper for launching react component which makes a request to sitemap controller endpoint.
Rspec unit controller tests cover `sitemap` controller and a model.
Capybara integration tests cover interaction with frontend and backend and mimic user behaviour.

Requirements
---------

* Rails 6
* Ruby 2.7.0
* SQLite
* React
* Rspec
* Capybara

Quick start
---------

Install:

```
$ brew install sqlite yarn
$ bundle install
$ yarn install
```

Database setup:

```
$ bin/rake db:create db:migrate db:seed
```

Start server:

```
$ rails s
```

React
-----------------

### Webpack

The [Webpacker gem](https://github.com/rails/webpacker) handles the Webpack compiling of the code and is automatically run on the server. Custom [Webpack settings](https://github.com/rails/webpacker/blob/master/docs/webpack.md) can be set in `/config/webpack`

```
$ yarn start
```

Testing
---------

To run the entire test suite:

```
$ rspec
```
