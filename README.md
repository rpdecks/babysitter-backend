# Babysitter App Back end
An interface for those with children and local child care providers, Babysitter aims to connect those in need with those who care. Parents can schedule and post babysitting jobs online and find qualified, vetted, and experienced babysitters in their area. Browse caregiver profiles, read reviews, and communicate directly with caregivers to find the best one for the job.

Caregivers can create a profile, browse, and apply for available babysitting jobs. Over time, caregivers can build a portfolio of completed work with positive reviews to build brand and reputation in their community enabling them to secure more jobs and higher pay..

# Motivation
As a father of 3 small children and living in a small college town, it's always a challenge to find childcare. You need a way to expand the number of people you know. At the same time, those who want to babysit need to do the same to increase their income and job quality. They say, "quality comes out quantity."  

This app should help these two groups of peole find each other much easier.

# Build status
Heroku App  
This app has been deployed to Heroku [here](https://babysitter-front.herokuapp.com/). Please see the login instructions on the web application to view login information.

# Screenshots
![screenshot](/public/babysitter.jpg?raw=true "screenshot")

# Tech framework used
Built with:
* [React Javascript](https://reactjs.org/)
* [React Redux](https://react-redux.js.org/)
* [Ruby on Rails backend API](https://github.com/rpdecks/babysitter-backend)
* [Postgresql](https://www.postgresql.org/)
* [FullCalendar API](https://fullcalendar.io/docs)
* [React Bootstrap](https://react-bootstrap.github.io/)
* HTML / CSS

## Features
* Post, apply for, and award babysitting jobs
* Galleries of employers/babysitters
* Interactive calendar interface for job schedule management
* Dynamic filtered calendar/tabular views for ease of use/navigation
* Client-side routing (React Router)
* Read/post reviews of employers & babysitters
* bCrypt / JWT encryption for security

# How to Use
The back end install steps require the following on your system
* [Ruby on Rails](https://rubyonrails.org/)
* [Postgresql](https://www.postgresql.org/)

## Install Instructions
1. Clone this repository to you local machine.
2. Once cloned, navigate to the base folder of this repository.
3. Run bundle install in the terminal to install necessary gems.
4. Run rails db:setup to set up the database.
5. Run rails s to start the rails server.

**Note:** The front end software must be downloaded and running as well. See the front end project [here | Babysitter-frontend](https://github.com/rpdecks/babysitter-frontend).

