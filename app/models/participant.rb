class Participant
  include ActiveModel::Model
  attr_accessor :subject_id, :participant_id
  validates_presence_of :subject_id, :participant_id

  def save
    if valid?
      begin
        Subject.find(subject_id).students << Student.find(participant_id)
      rescue StandardError
        false
      end
      true
    else
      false
    end
  end

  class << self
    def unassign(subject_id, participant_id)
      Subject.find(subject_id).students.delete(Student.find(participant_id))
    rescue StandardError
      false
    end
  end
end
