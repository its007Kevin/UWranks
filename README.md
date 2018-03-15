# UWranks

A social network for co op students at the University of Waterloo to discuss about their rankings with each other

## Requirements
```
Ruby 2.5.0
Rails 5.1.4
Postgres 9.5
```
### [Setup Guide for Ruby on Rails and Postgres](https://gorails.com/setup/ubuntu/16.04)
## Installation
Fork the repository
```
git clone https://github.com/YOUR-USERNAME/UWranks.git
cd UWranks.git
bundle install
```
Navigate to /config and create a file called 'secrets.yml' 
Paste this in
```
development:
  secret_key_base:
```
Run
```
bundle exec rake secret
```
Paste the output into
```
development:
  secret_key_base: INSERT_KEY_HERE
```
Run locally
```
rails server
```
Navigate to http://localhost:3000