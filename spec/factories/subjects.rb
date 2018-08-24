FactoryGirl.define do
  factory :subject do
    title 'SubjectTitle'
    association :teacher, factory: :teacher

    factory :subject_with_students do
      students { build_list :student, 3 }
    end
  end
end
