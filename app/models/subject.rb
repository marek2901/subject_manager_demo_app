class Subject < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :teacher
  validates_presence_of :teacher, message: 'You cant create subject without teacher'

  has_and_belongs_to_many :students

  def participants
    students.distinct
  end
end
