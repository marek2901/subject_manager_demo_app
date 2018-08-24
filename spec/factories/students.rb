FactoryGirl.define do
  factory :student do
    first_name 'Example'
    last_name 'Student'

    factory :student_with_subjects do
      subjects { build_list :subject, 3 }
    end
  end
end
