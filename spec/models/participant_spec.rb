require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe 'save' do
    before(:each) do
      @subject = create(:subject)
      @student = create(:student)
    end

    it 'returns true when valid' do
      participant = Participant.new
      participant.subject_id = @subject.id
      participant.participant_id = @student.id

      expect(participant.save).to eq true
    end

    describe 'assign' do
      before(:each) do
        participant = Participant.new
        participant.subject_id = @subject.id
        participant.participant_id = @student.id
        participant.save
      end

      it 'assigns new student to subject when valid' do
        expect(@subject.students.count).to eq 1
      end

      it 'assigns new subject to student when valid' do
        expect(@student.subjects.count).to eq 1
      end
    end

    it 'returns false when invalid' do
      participant = Participant.new
      participant.subject_id = @subject.id

      expect(participant.save).to eq false
    end

    it 'removes participant from subject' do
      subject = create(:subject_with_students)
      expect do
        Participant.unassign subject.id, subject.students.first.id
      end.to change(subject.students, :count).by(-1)
    end
  end
end
