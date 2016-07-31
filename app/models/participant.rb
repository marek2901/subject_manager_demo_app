class Participant
  include ActiveModel::Model
  attr_accessor :subject_id, :participant_id
  validates_presence_of :subject_id, :participant_id

  def save
    if valid?
      Subject.find(subject_id).students << Student.find(participant_id) rescue return false
      true
    else
      false
    end
  end
end
