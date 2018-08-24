require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'is not saved without title' do
    expect { create(:subject, title: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is saved with valid params' do
    expect { create(:subject) }.to change(Subject, :count).by(1)
  end

  it 'has_one teacher' do
    subject = create(:subject)
    expect(subject.teacher).to be_a(Teacher)
  end

  it 'has many students' do
    expect(create(:subject_with_students).students.size).to eq 3
  end

  it 'subject is of class Subject' do
    expect(create(:subject_with_students).students.first).to be_a(Student)
  end

  it 'is not created without teacher' do
    expect { create(:subject, teacher: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  describe '#participants' do
    it 'returns Array' do
      expect(create(:subject_with_students).participants).to be_a_kind_of(Enumerable)
    end

    it 'each element is type of Student' do
      expect(create(:subject_with_students).participants.sample).to be_a_kind_of(Student)
    end

    it 'returns only uniq records' do
      subj = create(:subject)
      participant = create(:student)
      5.times { subj.students << participant }
      expect(subj.participants.size).to eq 1
    end

    it 'returns only uniq records' do
      subj = create(:subject)
      participant = create(:student)
      participant2 = create(:student, last_name: 'Dwa')
      5.times { subj.students << participant }
      subj.students << participant2
      expect(subj.participants.size).to eq 2
    end
  end
end
