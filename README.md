# Bookmark Manager
### Makers Academy Week No. 4

[![Build Status](https://travis-ci.org/KatHicks/bookmark-manager.svg?branch=master)](https://travis-ci.org/KatHicks/bookmark-manager) [![Coverage Status](https://coveralls.io/repos/github/KatHicks/bookmark-manager/badge.svg?branch=master)](https://coveralls.io/github/KatHicks/bookmark-manager?branch=master) [![Code Climate](https://codeclimate.com/github/KatHicks/bookmark-manager/badges/gpa.svg)](https://codeclimate.com/github/KatHicks/bookmark-manager)

### Instructions

We worked through the challenges throughout the week in rotating pairs.

> You're going to build a bookmark manager. A bookmark manager is a website to maintain a collection of URLs. You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse links other users have added.

Below are the high-level user stories that this project was intended to satisfy:

```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of links on the homepage

As a time-pressed user
So that I can quickly find web sites I recently bookmarked
I would like to see links in descending chronological order

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to my bookmark manager

As a time-pressed user
So that I can organise my many links into different categories for ease of search
I would like to add tags to the links in my bookmark manager

As a time-pressed user
So that I can quickly find links on a particular topic
I would like to filter links by tag
```

### Objectives

* Are you having fun?
* Are you a better developer than you were yesterday?
* **Can you build a web app that uses a database?**

### Using my application

* Download the source code using `$ git clone`
* Navigate into the root of the directory using `$ cd`
* Install all the dependencies by running the command `$ bundle` in the root directory
* Download PostgreSQL (if you do not already have it installed)
* Enter `$ psql` in the command line and create two databases (needed for the app)
  * Type `$ create database bookmark_manager_development;`
  * Then, type `$ create database bookmark_manager_test;`
  * Enter `$ \q` to quit PSQL
* Run `$ shotgun` in the command line to run the app
* Go to `localhost:9393` in a browser to view and interact with the app

You can also view the deployed version [here](https://damp-hollows-89172.herokuapp.com/).

### Running the tests

* Within the root of the directory, run `$ rspec` to run the tests and see the results in the command line

### Dependencies

* Application written in **Ruby 2.3.3**
* Built using the **Sinatra** web framework
* Based on a **PostgreSQL** database with **DataMapper** as the ORM
* Uses **BCrypt** for password encryption
* Unit tests written in **RSpec**
* Feature tests written using **RSpec** and **Capybara**

### Approach

* With regard to the data structure used:
  * We set it up to have a many-to-many relationship between links and tags, which allowed links to have multiple tags
  * We then had a one-to-many relationship between users and tags
* The web app architecture follows the MVC pattern, as with other projects

### Reflections

* Found this a really interesting project and felt like we were building something 'real'
* Was interesting to read up about password hashing
* Deploying to Heroku was quite tricky - but interesting to see how you set up a production database
* Was also interesting to see how the models changed from this project and the last (see [Battle](https://github.com/KatHicks/battle)) as they went from classes full of methods to essentially schemas for the database tables

### Ideas for extension

* Would be nice to give our app some styling
* Would also be good to add proper buttons for the links filtering, rather than just leaving them as routes

### Collaborators

Eleanor Kavanagh-Brown, Katerina Loschinina, Shoniwa Marovatsanga, Irene Canuti, Barbara Shinkarenko
