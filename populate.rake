 namespace :db do
  desc " fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

 Person.populate 100 do |person|
      user.first_name    = Faker::Name.first_name
      user.last_name = Faker::Name.last_name
      person.email   = Faker::Internet.email
      person.username  = Populator.words(1).titleize
   
    end
  end
endnamespace :db do
end
end
