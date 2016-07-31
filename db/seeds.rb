# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "marek2901@gmail.com", password: "knownpassword")

teachers = []
3.times do |n|
  teachers << Teacher.create(first_name: "Teacher#{n}", last_name: "Example", title: "Dr.")
end

subjects = []
5.times do |n|
  subjects << Subject.create(title: "Subject#{n}", teacher: teachers.sample)
end

students = []
25.times do |n|
  students << Student.create(first_name: "Student#{n}", last_name: "Exampleee")
end

4.times do
  students.each do |student|
    participant = Participant.new
    participant.participant_id = student.id
    participant.subject_id = subjects.sample.id
    participant.save
  end
end
