# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

User.create name: 'Kate', role: admin, email: katharine.montgomery@gmail, profile: "I built this so please be nice about it"
User.create name: 'KANYE', role: artist, email: kanye@mememe.com, profile: "I AM YEEZUS"
User.create name: 'Kim Kardashian', role: listener, email: kanye@mememe.com, profile: "I married Yeezus"

Track.delete_all

Track.create name: 'test track'
Track.create name: 'test track 2'