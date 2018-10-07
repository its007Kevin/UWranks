# UW Ranks

A social network for co op students at the University of Waterloo to discuss their rankings with each other.

![](https://github.com/its007Kevin/UWranks/blob/master/sc1.png)

---

![](https://github.com/its007Kevin/UWranks/blob/master/sc2.png)

---

![](https://github.com/its007Kevin/UWranks/blob/master/sc3.png)

## Installation

### Requirements
```
Ruby 2.5.0
Rails 5.1.4
Postgres 9.5
```
#### [Setup guide for Ruby on Rails](https://gorails.com/setup/ubuntu/16.04)

Start by cloning your fork
```
git clone https://github.com/YOUR-USERNAME/UWranks.git
cd UWranks.git
```
Install dependencies
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
