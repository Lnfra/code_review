# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


CodeLanguage.destroy_all
Location.destroy_all
Role.destroy_all

[
    {name: "Javascript"},
    {name: "Ruby"},
    {name: "Pseudo Code"}
].each do |language|
  CodeLanguage.create!(language)
end

[
    {
        name: "GA Singapore",
        city: "Singapore",
        country:"Singapore"
    },
    {
        name: "GA Sydney",
        city: "Sydney",
        country:"Australia"
    },
].each do |location|
  Location.create!(location)
end

[
    {name: "Student"},
    {name: "Instructor"},
    {name: "Teaching Assistant"},
    {name: "Administrator"}
].each do |role|
  Role.create!(role)
end
