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
Classroom.destroy_all
User.destroy_all

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

[
    {
        name: "SG WDI 2",
        start_date: Date.parse("2016-02-15"),
        end_date: Date.parse("2016-05-16"),
        location: Location.find_by_name('GA Singapore')
    },
    {
        name: "SG WDI 1",
        start_date: Date.parse("2015-11-06"),
        end_date: Date.parse("2016-01-07"),
        location: Location.find_by_name('GA Singapore')
    }

].each do |classroom|
  Classroom.create!(classroom)
end


#To populate one to many relationship use Classroom.find_by_name
#To populate one has and belongs to many relationship, use Role.where(:name => ...)
[
    {
        :name => 'Irvin',
        :roles => Role.where(:name => ['Teaching Assistant', 'Administrator']),
        :email => 'irvin@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'Jesstern',
        :roles => Role.where(:name => ['Teaching Assistant', 'Administrator']),
        :email => 'jesstern@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'Jeremiah',
        :roles => Role.where(:name => ['Instructor', 'Administrator']),
        :email => 'jeremiah@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'Angeline',
        :roles => Role.where(:name => ['Student', 'Administrator']),
        :email => 'angeline@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'Allan',
        :roles => Role.where(:name => ['Student']),
        :email => 'Allan@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'Gabrielle',
        :roles => Role.where(:name => ['Teaching Assistant']),
        :email => 'gabrielle@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'Hakim',
        :roles => Role.where(:name => ['Student']),
        :email => 'hakim@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'Joanne',
        :roles => Role.where(:name => ['Student']),
        :email => 'joanne@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'Junius',
        :roles => Role.where(:name => ['Student']),
        :email => 'junius@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'Leok Si',
        :roles => Role.where(:name => ['Student']),
        :email => 'leoksi@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    },
    {
        :name => 'David',
        :roles => Role.where(:name => ['Student']),
        :email => 'david@gf.com',
        :password => 'password',
        :password_confirmation => 'password',
        :classroom => Classroom.find_by_name('SG WDI 2')
    }
].each do |user|
  User.create!(user)
end