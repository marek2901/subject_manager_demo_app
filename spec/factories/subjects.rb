FactoryGirl.define do
  factory :subject do
    title "SubjectTitle"

    factory :subject_with_teacher do
      association :teacher, factory: :teacher
    end

    factory :subject_with_students do
      students { build_list :student, 3 }
    end
  end
end
