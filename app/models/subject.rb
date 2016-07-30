class Subject < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :teacher
  
end
