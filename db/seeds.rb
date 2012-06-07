# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USERS'

user = User.create! :name => 'Joe Blo', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name
user.add_role :user

admn = User.create! :name => 'Kenny Blankenship', :email => 'admn@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New admin created: ' << admn.name
admn.add_role :admin

exec = User.create! :name => 'Jeffery Templeton', :email => 'exec@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New execuctive created: ' << exec.name
exec.add_role :executive

mgmt = User.create! :name => 'Craig Smith', :email => 'mgmt@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New manager created: ' << mgmt.name
mgmt.add_role :manager

tech = User.create! :name => 'Doug Wilson', :email => 'tech@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New technician created: ' << tech.name
tech.add_role :technician
