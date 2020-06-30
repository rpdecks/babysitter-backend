require 'faker'
require 'pry'

CaregiverFavorite.destroy_all
EmployerFavorite.destroy_all
CaregiverReview.destroy_all
EmployerReview.destroy_all
Candidate.destroy_all
Job.destroy_all
Employer.destroy_all
Caregiver.destroy_all

puts 'Creating Employers'
20.times do 
    Employer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, gender: Faker::Gender.binary_type, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, dob: Faker::Date.birthday(min_age: 18, max_age: 65), smoker: Faker::Boolean.boolean, bio: Faker::Lorem.sentence(word_count: 30), address: Faker::Address.street_address, has_pets: Faker::Boolean.boolean, job_count: rand(0-20), password: '123')
end

puts 'Creating Caregivers'
20.times do 
    Caregiver.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, gender: Faker::Gender.binary_type, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, dob: Faker::Date.birthday(min_age: 18, max_age: 65), smoker: Faker::Boolean.boolean, bio: Faker::Lorem.sentence(word_count: 30), address: Faker::Address.street_address, has_pets: Faker::Boolean.boolean, job_count: rand(0-20), pay_rate: rand(10.00-25.00), first_aid_cert: Faker::Boolean.boolean, password: '123')
end

puts 'Creating Jobs'
120.times do
    # to ensure jobs are 1-8 hours long max/min
    time = Faker::Time.between_dates(from: Date.today, to: Date.today + 30, period: :day)
    finish = time + (rand(1-8)).hours

    infants =  [0,1].sample
    toddlers = [0,1,2].sample
    school_age = [0,1,2,3].sample 
    total = infants + toddlers + school_age
    job_title = ['Babysitting job', 'Date night', 'Company retreat', 'Nanny job', 'Anniversary date'].sample

    Job.create(employer_id: Employer.all.sample.id, caregiver_id: Caregiver.all.sample.id, start_time: time, end_time: finish, desc: Faker::Lorem.sentence(word_count: 30), location: Faker::Address.street_address, total_child_count: total, infant_count: infants, toddler_count: toddlers, school_age_count: school_age, smoker: Faker::Boolean.boolean, first_aid_cert: Faker::Boolean.boolean, status: ['complete', 'incomplete'].sample, pay_rate: rand(10.5-20), title: job_title)
end

puts 'Creating Jobs w/o caregivers assigned'
120.times do
    # to ensure jobs are 1-8 hours long max/min
    time = Faker::Time.between_dates(from: Date.today, to: Date.today + 30, period: :day)
    finish = time + (rand(1-8)).hours

    infants =  [0,1].sample
    toddlers = [0,1,2].sample
    school_age = [0,1,2,3].sample 
    total = infants + toddlers + school_age

    job = Job.create(employer_id: Employer.all.sample.id, start_time: time, end_time: finish, desc: Faker::Lorem.sentence(word_count: 30), location: Faker::Address.street_address, total_child_count: total, infant_count: infants, toddler_count: toddlers, school_age_count: school_age, smoker: Faker::Boolean.boolean, first_aid_cert: Faker::Boolean.boolean, )

    5.times do 
        Candidate.create(job_id: job.id, caregiver_id: Caregiver.all.sample.id)
    end
end

puts 'Creating Caregiver Reviews'
20.times do
    sitters = Caregiver.all.select { |cg| cg.employers.length > 0}
    cg = sitters.sample
    emp = cg.employers.sample
    
    CaregiverReview.create(caregiver_id: cg.id, employer_id: emp.id, rating: rand(1-5), content: Faker::Lorem.sentence(word_count: 30))
end

puts 'Creating Employer Reviews'
20.times do
    employers = Employer.all.select { |e| e.caregivers.length > 0}
    emp = employers.sample
    cg = emp.caregivers.sample

    EmployerReview.create(caregiver_id: cg.id, employer_id: emp.id, rating: rand(1-5), content: Faker::Lorem.sentence(word_count: 30))
end

puts 'Creating Employer Favorites'
5.times do
    EmployerFavorite.create(caregiver_id: Caregiver.all.sample.id, employer_id: Employer.all.sample.id)
end

puts 'Creating Caregiver Favorites'
5.times do
    CaregiverFavorite.create(caregiver_id: Caregiver.all.sample.id, employer_id: Employer.all.sample.id)
end
