FactoryGirl.define do
  factory :teacher do
    first_name "Example"
    last_name "Teacher"
    title "Dr."

    factory :teacher_with_subjects do
      subjects { build_list :subject, 3 }
    end
  end
end
