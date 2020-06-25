require 'faker'
require 'pry'

User.destroy_all
Job.destroy_all

puts 'Creating Users'
20.times do 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, gender: Faker::Gender.binary_type, username: Faker::Internet.username, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, dob: Faker::Date.birthday(min_age: 18, max_age: 65), smoker: Faker::Boolean.boolean, first_aid_cert: Faker::Boolean.boolean, bio: Faker::Lorem.sentence(word_count: 30), pay_rate: rand(10-20), address: Faker::Address.street_address, has_pets: Faker::Boolean.boolean)
end

puts 'Creating Jobs'
20.times do
    # to ensure jobs are 1-8 hours long max/min
    time = Faker::Time.between_dates(from: Date.today, to: Date.today + 30, period: :day)
    finish = time + (rand(1-8)).hours

    Job.create(employer_id: User.all.sample.id, start_time: time, end_time: finish, desc: Faker::Lorem.sentence(word_count: 30), location: Faker::Address.street_address, total_children: 3, infants: 1, toddlers: 1, school_age: 1, smoking: [true, false].sample, first_aid_cert: [true, false].sample)
end

puts 'Creating Reviews'
# 20.times do

# end