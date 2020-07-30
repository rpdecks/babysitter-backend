require 'faker'

CaregiverFavorite.destroy_all
EmployerFavorite.destroy_all
CaregiverReview.destroy_all
EmployerReview.destroy_all
Candidate.destroy_all
Job.destroy_all
Employer.destroy_all
Caregiver.destroy_all

image_urls = [
'https://babysitters-app.s3.amazonaws.com/1.jpeg',
'https://babysitters-app.s3.amazonaws.com/2.jpeg',
'https://babysitters-app.s3.amazonaws.com/3.jpeg',
'https://babysitters-app.s3.amazonaws.com/4.jpeg',
'https://babysitters-app.s3.amazonaws.com/5.jpeg',
'https://babysitters-app.s3.amazonaws.com/6.jpeg',
'https://babysitters-app.s3.amazonaws.com/7.jpeg',
'https://babysitters-app.s3.amazonaws.com/8.jpeg',
'https://babysitters-app.s3.amazonaws.com/9.JPG',
'https://babysitters-app.s3.amazonaws.com/10.JPG',
'https://babysitters-app.s3.amazonaws.com/11.JPG',
'https://babysitters-app.s3.amazonaws.com/12.JPG',
'https://babysitters-app.s3.amazonaws.com/14.jpg',
'https://babysitters-app.s3.amazonaws.com/15.jpeg',
'https://babysitters-app.s3.amazonaws.com/16.jpeg',
'https://babysitters-app.s3.amazonaws.com/17.JPG', 
'https://babysitters-app.s3.amazonaws.com/18.JPG', 
'https://babysitters-app.s3.amazonaws.com/19.JPG', 
'https://babysitters-app.s3.amazonaws.com/21.JPG']

puts 'Creating Employers'
20.times do 
    Employer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, gender: Faker::Gender.binary_type, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, dob: Faker::Date.birthday(min_age: 18, max_age: 65), smoker: Faker::Boolean.boolean, bio: Faker::Lorem.sentence(word_count: 30), address: Faker::Address.street_address, has_pets: Faker::Boolean.boolean, password: '123', image: image_urls.sample)
end

puts 'Creating Caregivers'
20.times do 
    Caregiver.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, gender: Faker::Gender.binary_type, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, dob: Faker::Date.birthday(min_age: 18, max_age: 65), smoker: Faker::Boolean.boolean, bio: Faker::Lorem.sentence(word_count: 30), address: Faker::Address.street_address, has_pets: Faker::Boolean.boolean, pay_rate: rand(10..25).to_i, first_aid_cert: Faker::Boolean.boolean, password: '123', image: image_urls.sample)
end

puts 'Creating Jobs'
60.times do
    # to ensure jobs are 1-8 hours long max/min
    start = Faker::Time.between_dates(from: Date.today, to: Date.today + 30, period: :all) 
    ending = start + [7200, 14400, 21600, 28800].sample

    infants =  [0,1].sample
    toddlers = [0,1,2].sample
    school_age = [0,1,2,3].sample 
    total = infants + toddlers + school_age
    job_title = ['Babysitting job', 'Date night', 'Company retreat', 'Nanny job', 'Anniversary date'].sample

    Job.create(employer_id: Employer.all.sample.id, caregiver_id: Caregiver.all.sample.id, start_time: start, end_time: ending, desc: Faker::Lorem.sentence(word_count: 30), job_location: Faker::Address.street_address, total_child_count: total, infant_count: infants, toddler_count: toddlers, school_age_count: school_age, non_smoking: Faker::Boolean.boolean, first_aid_cert: Faker::Boolean.boolean, has_pets: Faker::Boolean.boolean, status: ['complete', 'incomplete'].sample, pay_rate: rand(10..20).to_i, title: job_title)
end

puts 'Creating Jobs w/o caregivers assigned'
60.times do
    # to ensure jobs are 1-8 hours long max/min
    start = Faker::Time.between_dates(from: Date.today, to: Date.today + 30, period: :all) 
    ending = start + [7200, 14400, 21600, 28800].sample

    infants =  [0,1].sample
    toddlers = [0,1,2].sample
    school_age = [0,1,2,3].sample 
    total = infants + toddlers + school_age
    job_title = ['Babysitting job', 'Date night', 'Company retreat', 'Nanny job', 'Anniversary date', 'No good reason'].sample

    job = Job.create(employer_id: Employer.all.sample.id, start_time: start, end_time: ending, desc: Faker::Lorem.sentence(word_count: 30), job_location: Faker::Address.street_address, total_child_count: total, infant_count: infants, toddler_count: toddlers, school_age_count: school_age, non_smoking: Faker::Boolean.boolean, first_aid_cert: Faker::Boolean.boolean, has_pets: Faker::Boolean.boolean, title: job_title, pay_rate: rand(10..25))

    [1,2,3].sample.times do 
        Candidate.create(job_id: job.id, caregiver_id: Caregiver.all.sample.id)
    end
end

puts 'Creating Caregiver Reviews'
50.times do
    sitters = Caregiver.all.select { |cg| cg.employers.length > 0}
    cg = sitters.sample
    emp = cg.employers.sample
    
    CaregiverReview.create(caregiver_id: cg.id, employer_id: emp.id, rating: rand(1..5), title: Faker::Lorem.sentence(word_count: 5), content: Faker::Lorem.sentence(word_count: 30))
end

puts 'Creating Employer Reviews'
50.times do
    employers = Employer.all.select { |e| e.caregivers.length > 0}
    emp = employers.sample
    cg = emp.caregivers.sample

    EmployerReview.create(caregiver_id: cg.id, employer_id: emp.id, rating: rand(1..5), title: Faker::Lorem.sentence(word_count: 5), content: Faker::Lorem.sentence(word_count: 30))
end

puts 'Creating Employer Favorites'
100.times do
    EmployerFavorite.create(caregiver_id: Caregiver.all.sample.id, employer_id: Employer.all.sample.id)
end

puts 'Creating Caregiver Favorites'
100.times do
    CaregiverFavorite.create(caregiver_id: Caregiver.all.sample.id, employer_id: Employer.all.sample.id)
end
