# UWranks

A social network for co op students at the University of Waterloo to discuss about their rankings with each other

## Installation

### Requirements
```
Ruby 2.5.0
Rails 5.1.4
Postgres 9.5
```
### [Setup guide for Ruby on Rails and Postgres](https://gorails.com/setup/ubuntu/16.04)

Start by forking and cloning your fork
```
git clone https://github.com/YOUR-USERNAME/UWranks.git
cd UWranks.git
```
Install dependecies
```
bundle install
```
Setup Local Database
```
rake db:create
rake db:migrate
```
Run the Server
```
rails server
```
Navigate to https://localhost:3000
