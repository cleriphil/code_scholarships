# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
  {username: 'admin',name: 'admin', password: 'admin', password_confirmation: 'admin', email:'admin@admin.com', donor: true, admin: true, city: 'admin', description: 'admin'},
  {username: 'donor',name: 'donor', password: 'donor', password_confirmation: 'donor', email:'donor@donor.com', donor: true, admin: false, city: 'donor', description: 'donor'},
  {username: 'seeker',name: 'seeker', password: 'seeker', password_confirmation: 'seeker', email:'seeker@seeker.com', donor: false, admin: false, city: 'seeker', description: 'seeker'}
  ])
