FactoryGirl.define do
  factory :subject do
    title "SubjectTitle"

    factory :subject_with_teacher do
      association :teacher, factory: :teacher
    end
  end
end
