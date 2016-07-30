class Subject < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :teacher

  has_and_belongs_to_many :students
end
