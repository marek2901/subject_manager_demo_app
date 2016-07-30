require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'is not saved without title' do
    expect { create(:subject, title: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is saved with valid params' do
    expect { create(:subject) }.to change(Subject, :count).by(1)
  end

  it 'has one teacher' do
    subject = create(:subject_with_teacher)
    expect(subject.teacher).to be_a(Teacher)
  end

  it 'has many students' do
    expect(create(:subject_with_students).students.size).to eq 3
  end

  it 'subject is of class Subject' do
    expect(create(:subject_with_students).students.first).to be_a(Student)
  end
end
