# Volunteer Tracker

#### Exercise in Ruby, Sinatra, routing, and incorporating a database with a one-to-many structure, 2.23.18

#### Emily Watkins

## Description

This application tracks volunteers for projects. A user can add new projects and assign volunteers to those projects.

## Setup

Clone this repository.

Install Ruby and postgres if necessary.

From root directory in terminal, run the following:

`$ bundle`  

To set up the database schema:

`$ createdb volunteer_tracker`  
`$ psql volunteer_tracker < database_backup.sql`  
`$ createdb -T volunteer_tracker volunteer_tracker_test`

To run the server:

`$ ruby app.rb`


In your browser, navigate to localhost:4567/ to view app.

## Functionality

* User can create new projects

* User can view details of each project including volunteers assigned to that project.

* User can create volunteers and assign them to a specific project.

* User can edit names of volunteers and titles of projects and delete projects.


## Technologies Used

* Ruby
* Sinatra
* PostgreSQL


## License

Licensed under the MIT License.

Copyright (c) 2018 Emily Watkins
