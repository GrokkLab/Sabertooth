# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'

user = User.create! :name => 'Joe Blo', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name

admn = User.create! :name => 'Kenny Blankenship', :email => 'admn@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << admn.name
admn.add_role :admin

mgmt = User.create! :name => 'Craig Smith', :email => 'mgmt@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New mgmt created: ' << mgmt.name
mgmt.add_role :mgmt

tech = User.create! :name => 'Doug Wilson', :email => 'tech@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New tech created: ' << tech.name
tech.add_role :tech
