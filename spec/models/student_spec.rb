require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'is not saved when first_name is not provided' do
    expect { create(:student, first_name: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is not saved when last_name is not provided' do
    expect { create(:student, last_name: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is saved with valid params' do
    expect { create(:student) }.to change(Student, :count).by(1)
  end

  it 'has many subjects' do
    expect(create(:student_with_subjects).subjects.size).to eq 3
  end

  it 'subject is of class Subject' do
    expect(create(:student_with_subjects).subjects.first).to be_a(Subject)
  end

  describe '#full_name' do
    it 'shows students name and surname' do
      expect(create(:student).full_name).to eq 'Example Student'
    end
  end
end
