require 'faker'
require 'pry'

User.destroy_all

puts 'Creating Users'
20.times do 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, gender: Faker::Gender.binary_type, username: Faker::Internet.username, email: Faker::Internet.email, phone, dob: Faker::Date.birthday(min_age: 18, max_age: 65), smoker: Faker::Boolean.boolean, first_aid_cert: Faker::Boolean.boolean bio: Faker::Lorem.sentence(word_count: 30), pay_rate: rand(10-20), address: Faker::Address.street_address, has_pets: Faker::Boolean.boolean)
end

puts 'Creating Jobs'

20.times do
    Job.new()
end

